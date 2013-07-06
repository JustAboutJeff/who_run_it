class Route < ActiveRecord::Base
  attr_accessible :name, :distance
  
  has_many :events
  has_many :waypoints

  # validates_presence_of

  def center_point
    latitudes = []
    longitudes = []
    self.waypoints.each do |waypoint|
      latitudes << waypoint.latitude
      longitudes << waypoint.longitude
    end
    latitudes.sort!
    longitudes.sort!
    center_lat = (latitudes.first + latitudes.last)/2.0
    center_lng = (longitudes.first + longitudes.last)/2.0
    [center_lat, center_lng]
  end

  def zoom
    
  end
end
