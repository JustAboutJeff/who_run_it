class Notification < ActiveRecord::Base
  attr_accessible :user_id, :event_id
  
  belongs_to :user
  belongs_to :event

  validates_presence_of :user_id, :event_id
end
