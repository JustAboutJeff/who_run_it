class Setting < ActiveRecord::Base
  attr_accessible :user_id, :location_id, :notification_method
  
  belongs_to :user
  belongs_to :location
end
