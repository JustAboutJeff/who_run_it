class LocationSettingsController < ApplicationController

  # GET /location_settings
  def index
    @location_settings = current_user.location_settings.all
  end

  # GET /location_settings/:id
  def show
    @location_setting = current_user.location_settings.find(params[:id])
    @coords = [@location_setting.latitude, @location_setting.longitude]
  end

  # GET /location_settings/new
  def new
    @location_setting = LocationSetting.new
  end

  # POST /location_settings
  def create
    location_setting = LocationSetting.new(params[:location_setting])
    coords = Geocoder.coordinates(params[:address])
    location_setting.update_attributes(latitude: coords[0],
                                       longitude: coords[1])
    if location_setting.save
      redirect_to profile_path(current_user)
    else
      render :new
    end
  end

end
