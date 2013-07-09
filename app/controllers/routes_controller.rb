class RoutesController < ApplicationController

  def show
    unless @route = Route.find_by_id(params[:id])
      redirect_to root_url
    end
    @waypoints = []
    @route.waypoints.each do |waypoint|
      @waypoints << [waypoint.latitude, waypoint.longitude]
    end
  end

  def remove
    route = Route.find_by_id(params[:id])
    route.toggle!(:saved)    
    render :nothing => true
  end
end
