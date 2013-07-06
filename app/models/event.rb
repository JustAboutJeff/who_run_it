class Event < ActiveRecord::Base
  attr_accessible :user_id, :title, :description, :route_id, :start_time, :pace, :url_key
  
  belongs_to :user
  belongs_to :route
  has_many   :waypoints, :through => :route
  has_many   :notifications
  has_many   :users, :through => :notifications

  validates_presence_of :user_id, :title, :route_id, :start_time, :pace

  before_save :generate_url_key

  def to_param
  	url_key
  end
  
  private
  def generate_url_key
  	self.url_key = SecureRandom.urlsafe_base64(5)
  end
end
