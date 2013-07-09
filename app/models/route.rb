class Route < ActiveRecord::Base
  attr_accessible :name, :distance, :saved
  
  has_many :events
  has_many :waypoints

  validates_presence_of  :name, :distance
  validates_length_of    :name, maximum: 30
  validates_inclusion_of :saved, :in => [0, 1]


  scope :saved, -> { where(saved: 1) }
end
