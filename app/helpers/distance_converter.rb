module DistanceConverter
  def meters_to_miles(meters)
    (meters.to_f*0.000621371).round(2)
  end
end
