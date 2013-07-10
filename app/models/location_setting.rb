class LocationSetting < ActiveRecord::Base
  attr_accessible :user_id, :name, :notification_frequency, :notification_method, 
                  :pace_min, :pace_max, :distance_min, :distance_max, :latitude, 
                  :longitude, :address, :search_radius

  belongs_to :user

  validates_presence_of :name, :notification_frequency, :notification_method, 
                        :pace_min, :pace_max, :distance_min, :distance_max, 
                        :search_radius, :address
  validates_uniqueness_of :name, :scope => :user_id

  before_validation :set_lat_lng

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
end


# create
# if address is blank, address cant be blank
# if address cannot be geocoded, address invalid error message
# if address can be geocoded, lat lng is set

# update
# if address it not altered, geocoding DOES NOT OCCUR
# if address is altered geocoding occurs and save object has newly set latlng
