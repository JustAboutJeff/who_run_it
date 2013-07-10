class LocationSetting < ActiveRecord::Base
  attr_accessible :user_id, :name, :notification_frequency, :notification_method, :pace_min, :pace_max, :distance_min, :distance_max, :latitude, :longitude

  belongs_to :user

  validates_presence_of :name, :notification_frequency, :notification_method, :pace_min, :pace_max, :distance_min, :distance_max, :latitude, :longitude
  validates_uniqueness_of :name, :scope => :user_id

  def email?
    (self.notification_method == "2") || (self.notification_method == "4")
  end

  def sms?
    (self.notification_method == "3") || (self.notification_method == "4")
  end
end
