class LocationSetting < ActiveRecord::Base
  attr_accessible :user_id, :notification_frequency, :notification_method, :latitude, :longitude
  
  belongs_to :user
end
