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
    if location_setting.save
      redirect_to '/profile'
    else
      render :new
    end
  end

end
