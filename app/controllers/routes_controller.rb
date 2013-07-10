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
    route.update_attributes(saved: 0)
    redirect_to profile_path(current_user), alert: "Route deleted!"
  end
end
