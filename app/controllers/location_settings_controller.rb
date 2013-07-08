class LocationSettingsController < ApplicationController

  def index
    @location_settings = current_user.location_settings.all
  end

  def show
    @location_setting = current_user.location_settings.find(params[:id])
    @coords = [@location_setting.latitude, @location_setting.longitude]
  end

  def new
    @location_setting = LocationSetting.new
  end

  def create
    location_setting = LocationSetting.new(params[:location_setting])
    coords = Geocoder.coordinates(params[:address])
    location_setting.update_attributes(latitude: coords[0],
                                       longitude: coords[1])
    if location_setting.save
      redirect_to '/profile'
    else
      render :new
    end
  end

  def destroy
    location_settings = LocationSettings.find(params[:id])
    location_settings.destroy
    redirect_to '/profile'
  end

  def edit
    location_setting = LocationSetting.find(params[:id])
    if location_setting.update_attributes(params[:location_settings])
      redirect_to /profile
    else
      render :edit
    end
  end

end
