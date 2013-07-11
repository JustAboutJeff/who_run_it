class LocationSetting < ActiveRecord::Base
  attr_accessible :user_id, :name, :notification_frequency, :notification_method,
                  :pace_min, :pace_max, :distance_min, :distance_max, :latitude,
                  :longitude, :address, :search_radius

  belongs_to :user

  validates_presence_of :name, :notification_frequency, :notification_method,
                        :pace_min, :pace_max, :distance_min, :distance_max,
                        :search_radius, :address
  validates_uniqueness_of   :name, :scope => :user_id
  validates_numericality_of :search_radius, greater_than: 0, less_than: 10
  validates_numericality_of :pace_max, :greater_than_or_equal_to => :pace_min, 
                            :message => "must be greater than or equal to pace min"
  validates_numericality_of :distance_max, :greater_than_or_equal_to => :distance_min, 
                            :message => "must be greater than or equal to distance min"
  
  before_validation :set_lat_lng
  before_save       :format_search_radius

  def email?
    (self.notification_method == "2") || (self.notification_method == "4")
  end

  def sms?
    (self.notification_method == "3") || (self.notification_method == "4")
  end

  private

  def set_lat_lng
    if address.present? && address_changed?
      latlng = Geocoder.coordinates(address)
      if latlng.is_a?(Array)
        self.latitude, self.longitude = latlng[0], latlng[1]
      else
        errors.add :base, "Address is invalid"
      end
    end
  end

  def format_search_radius
    self.search_radius = search_radius.round(2)
  end
end
