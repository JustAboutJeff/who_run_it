class Event < ActiveRecord::Base
  attr_accessible :user_id, :title, :description, :location_id, :pace, :start_time
  
  belongs_to :user
  belongs_to :location

  validates_presence_of :user_id, :title, :location_id, :start_time

  before_save :generate_url_key

  def to_param
  	url_key
  end
  
  private
  def generate_url_key
  	self.url_key = SecureRandom.urlsafe_base64(5)
  end
end
