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

  def to_param
  	url_key
  end

  private
  def generate_url_key
  	self.url_key = SecureRandom.urlsafe_base64(5)
  end
end
