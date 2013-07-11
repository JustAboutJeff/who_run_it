class LocationSettingsController < ApplicationController

  def index
    @location_settings = current_user.location_settings
  end

  def show
    if @location_setting = current_user.location_settings.find_by_id(params[:id])
      @coords = [@location_setting.latitude, @location_setting.longitude]
    else
      redirect_to profile_path(current_user), alert: 'Location not found.'
    end
  end

  def new
    @location_setting = LocationSetting.new
  end

  def create
    @location_setting = current_user.location_settings.new(params[:location_setting])

    if @location_setting.save
      redirect_to location_setting_path(@location_setting), notice: "Location created!"
    else
      render 'new'
    end
  end

  def destroy
    location_settings = LocationSetting.find(params[:id])
    location_settings.destroy
    redirect_to profile_path(current_user), alert: "Location deleted!"
  end

  def edit
    @location_setting = LocationSetting.find(params[:id])
  end

  def update
    @location_setting = LocationSetting.find(params[:id])

    if @location_setting.update_attributes(params[:location_setting])
      redirect_to location_setting_path(@location_setting), notice: "Location updated!"
    else
      render 'edit'
    end
  end
end
