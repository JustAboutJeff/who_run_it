class Event < ActiveRecord::Base
  attr_accessible :user_id, :title, :description, :location_id, :pace, :start_time
  
  belongs_to :user
  belongs_to :location

  validates_presence_of :user_id, :title, :location_id, :start_time
end