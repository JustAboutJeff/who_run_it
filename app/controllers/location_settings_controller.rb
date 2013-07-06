class LocationSettingsController < ApplicationController

  def index
    @location_settings = current_user.location_settings.all
  end

  def show
    @location_settings = current_user.location_settings.find(params[:id])
  end

  def new
    @location_setting = Location_Setting.new
  end

  def create
    location_setting = Location_Setting.new(params[:location_setting])
    if location_setting.save
      redirect_to '/profile'
    else
      render :new
    end
  end

end
