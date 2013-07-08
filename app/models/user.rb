class User < ActiveRecord::Base
  require 'digest'

  attr_accessible :username, :password, :email, :cellphone

  has_many :events
  has_many :routes, :through => :events, :uniq => true
  has_many :location_settings
  has_many :notifications

  has_secure_password

  validates_uniqueness_of :username, :email
  validates_presence_of   :username, :email, :password
  validates_format_of     :email, with: /\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i
  validates_length_of     :username, maximum: 16
  validates_length_of     :password, minimum: 6

  before_save :get_gravatar_hash
  before_save :format_phone_number

  private

  def get_gravatar_hash
    self.gravatar_hash = Digest::MD5.hexdigest( self.email.strip.downcase )
  end

  def format_phone_number
    if self.cellphone != nil
      digits = self.cellphone.gsub(/[^\d]/, '')
      self.cellphone = "1" + digits[-10..-1]
    end
  end
end
