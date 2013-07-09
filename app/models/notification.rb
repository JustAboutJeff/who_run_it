class Notification < ActiveRecord::Base
  attr_accessible :user_id, :event_id, :committed
  
  belongs_to :user
  belongs_to :event

  validates_presence_of   :user_id, :event_id
  validates_inclusion_of  :committed, :in => [true, false]
  validates_uniqueness_of :user_id, :scope => :event_id
end
