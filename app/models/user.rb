class User < ActiveRecord::Base
  require 'digest'

  attr_accessible :username, :password, :email, :cellphone

  has_many :events
  has_many :settings, :dependent => :destroy
  has_many :locations, :through => :settings

  has_secure_password

  validates_uniqueness_of :username, :email
  validates_presence_of :username, :email, :password
  validates_format_of :email, with: /\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i
  validates_length_of :password, minimum: 4

  before_save :get_gravatar_hash

  private

  def get_gravatar_hash
    self.gravatar_hash = Digest::MD5.hexdigest( self.email.strip.downcase )
  end

end
