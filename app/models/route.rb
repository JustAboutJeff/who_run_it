class Route < ActiveRecord::Base
  attr_accessible :name, :distance
  
  has_many :events
  has_many :waypoints

  # validates_presence_of
end
