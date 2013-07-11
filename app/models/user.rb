class User < ActiveRecord::Base
  require 'digest'

  attr_accessible :username, :password, :email, :cellphone

  has_many :events, :source => :event
  has_many :routes, :through => :events, :uniq => true
  has_many :location_settings
  has_many :notifications
  has_many :notified_events, :through => :notifications, :source => :event

  has_secure_password

  validates_uniqueness_of :username, :email
  validates_presence_of   :username, :email
  validates_format_of     :email, with: /\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i
  validates_length_of     :username, maximum: 16
  validates_length_of     :cellphone, minimum: 10, allow_blank: true
  validates_length_of     :password, minimum: 6, :if => :validate_password?
  validates_presence_of   :password, :if => :validate_password?

  before_validation :format_phone_number
  before_save       :get_gravatar_hash

  def display_phone_number
    phone = self.cellphone
    "(#{phone[1..3]}) #{phone[4..6]}-#{phone[7..10]}" unless phone == ""
  end

  private

  def get_gravatar_hash
    self.gravatar_hash = Digest::MD5.hexdigest( self.email.strip.downcase )
  end

  def format_phone_number
    unless self.cellphone == ""
      digits = self.cellphone.gsub(/[^\d]/, '')
      if digits.length >= 10
        self.cellphone = "1" + digits[-10..-1]
      else
        self.cellphone = digits
      end
    end
  end

  def validate_password?
    self.new_record? || password.nil? || password.length > 5
  end

end
