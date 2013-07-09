class LocationSetting < ActiveRecord::Base
  attr_accessible :user_id, :name, :notification_frequency, :notification_method, :pace_min, :pace_max, :distance_min, :distance_max, :latitude, :longitude, :address

  belongs_to :user

  validates_presence_of :name, :notification_frequency, :notification_method, :pace_min, :pace_max, :distance_min, :distance_max, :latitude, :longitude
  validates_uniqueness_of :name, :scope => :user_id
end
