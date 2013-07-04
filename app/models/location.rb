class Location < ActiveRecord::Base
  attr_accessible :latitude, :longitude
  
  has_many :settings
  has_many :events

  validates_presence_of :latitude, :longitude
  validates_uniqueness_of :latitude, :scope => :longitude
end
