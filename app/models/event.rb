class Event < ActiveRecord::Base
  attr_accessible :user_id, :title, :description, :route_id, :start_time, :pace, :url_key

  belongs_to :user
  belongs_to :route
  has_many   :waypoints, :through => :route
  has_many   :notifications
  has_many   :users, :through => :notifications

  validates_presence_of :user_id, :title, :route_id, :start_time, :pace
  validates_length_of   :title, maximum: 30
  validates_length_of   :description, maximum: 100

  before_save :generate_url_key

  scope :active, -> { where("start_time > ?", Time.now.utc) }

  def self.generate_time(hr, min, ampm)
    time = Time.now
    hour = hr.to_i
    minute = min.to_i
    if (ampm == "PM") && (hour != 12)
      hour += 12
    end
    p hour
    if hour > time.hour
      Time.parse("#{hour}:#{minute}:00")
    elsif (hour == time.hour) && (minute > time.min)
      Time.parse("#{hour}:#{minute}:00")
    else
      Time.parse("#{time.year}-#{time.month}-#{time.day+1} #{hour}:#{minute}:00")
    end
  end

  def create_notifications
    event_coords = [self.waypoints.first.latitude, self.waypoints.first.longitude]
    users_for_email = []
    users_for_text = []

    User.all.each do |user|
      sent_email = false
      sent_text = false
      user.location_settings.each do |location|
        if (self.pace >= location.pace_min) && (self.pace <= location.pace_max)
          if (self.route.distance >= location.distance_min) && (self.route.distance <= location.distance_max)
            location_coords = [location.latitude, location.longitude]
            if Geocoder::Calculations.distance_between(event_coords, location_coords) <= 10
              if (location.notification_method == "2") || (location.notification_method == "4")
                break if sent_email == true
                users_for_email << user.id
                sent_email = true
              end

              if (location.notification_method == "3") || (location.notification_method == "4")
                break if sent_text == true
                users_for_text << user.id
                sent_text = true
              end
            end
          end
        end
      end
      Notification.create(user_id: user.id, event_id: self.id, committed: 0) if ((sent_email == true) || (sent_text == true))
    end
    {email: users_for_email, text: users_for_text, event_id: self.id}
  end 

  def to_param
  	url_key
  end

  private
  def generate_url_key
  	self.url_key = SecureRandom.urlsafe_base64(5)
  end
end
