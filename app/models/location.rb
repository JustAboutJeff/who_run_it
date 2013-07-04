class Location < ActiveRecord::Base
  attr_accessible :latitude, :longitude
  
  has_many :settings
  has_many :events

  validates_presence_of :latitude, :longitude
  validates_uniqueness_of :latitude, :scope => :longitude

  before_save :round_values

  def round_values
  	self.latitude = self.latitude.round(6)
  	self.longitude = self.longitude.round(6)
  end
end
