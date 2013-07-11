class Event < ActiveRecord::Base
  attr_accessible :user_id, :title, :description, :route_id, :start_time, 
                  :pace, :url_key, :hour, :minute, :ampm

  attr_accessor :hour, :minute, :ampm, :do_not_validate_route

  belongs_to :user
  belongs_to :route
  has_many   :waypoints, :through => :route
  has_many   :notifications
  has_many   :users, :through => :notifications

  validates_presence_of :user_id, :title, :start_time, :pace
  validates_presence_of :route_id, :unless => :do_not_validate_route
  validates_length_of   :title, maximum: 30
  validates_length_of   :description, maximum: 100

  before_validation :generate_time

  before_save  :generate_url_key
  after_create :send_notifications

  scope :active, -> { where("start_time > ?", Time.now.utc) }


  def create_notifications
    event_coords = [self.waypoints.first.latitude, self.waypoints.first.longitude]
    users_for_email = []
    users_for_sms = []

    LocationSetting.where("pace_min <= ? AND pace_max >= ?", self.pace, self.pace).
                    where("distance_min <= ? AND distance_max >= ?", self.route.distance, self.route.distance).
                    each do |location_setting|
      location_coords = [location_setting.latitude, location_setting.longitude]
      if Geocoder::Calculations.distance_between(event_coords, location_coords) <= location_setting.search_radius
        users_for_email << location_setting.user_id if location_setting.email?
        users_for_sms << location_setting.user_id if location_setting.sms?
      end
    end

    Notification.create(user_id: self.user_id, event_id: self.id, committed: 1)

    (users_for_email + users_for_sms).uniq.each do |user_id|
      Notification.create(user_id: user_id, event_id: self.id, committed: 0)
    end

    users_for_email.delete(self.user_id)
    users_for_sms.delete(self.user_id)
    {email: users_for_email.uniq, sms: users_for_sms.uniq, event_id: self.id}
  end

  def send_notifications
    notification_recipients = self.create_notifications
    NotificationWorker.perform_async(notification_recipients)
  end

  def waypoint_coordinates
    self.waypoints.map do |waypoint|
      [waypoint.latitude, waypoint.longitude]
    end
  end

  def to_param
    url_key
  end


  private

  def generate_url_key
    self.url_key = SecureRandom.urlsafe_base64(5)
  end

  def generate_time
    time = Time.now
    hour = self.hour.to_i
    minute = self.minute.to_i
    if (self.ampm == "PM") && (hour != 12)
      hour += 12
    end
    if hour > time.hour
      self.start_time = Time.parse("#{hour}:#{minute}:00")
    elsif (hour == time.hour) && (minute > time.min)
      self.start_time = Time.parse("#{hour}:#{minute}:00")
    else
      self.start_time = Time.parse("#{time.year}-#{time.month}-#{time.day+1} #{hour}:#{minute}:00")
    end
  end
end
