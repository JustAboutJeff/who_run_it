class Waypoint < ActiveRecord::Base
  attr_accessible :route_id, :position, :latitude, :longitude
  
  belongs_to :route

  validates_presence_of :route_id, :position, :latitude, :longitude
end
