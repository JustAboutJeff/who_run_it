class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    @route = find_or_create_route

    time = Event.generate_time(params[:hour], params[:minute], params[:ampm])

    @event = Event.new(user_id: current_user.id,
                       title: params[:event][:title],
                       description: params[:event][:description],
                       route_id: @route.id,
                       start_time: time,
                       pace: params[:event][:pace])

    if @event.save
      redirect_to event_path(@event)
    else
      redirect_to profile_path(current_user)
    end
  end

  def show
    @event = Event.find_by_url_key(params[:id])
    redirect_to root_url unless @event
  end

  protected

  def find_or_create_route
    if params[:route] && (params[:waypoints] == "")
      Route.find(params[:route])
    else
      miles = (params[:distance].to_f*0.000621371).round(2)
      route = Route.create(name: params[:event][:title], distance: miles)
      create_waypoints(route)
      route
    end
  end

  def create_waypoints(route)
    @waypoints = params[:waypoints].split(",").each_slice(2).to_a
    @waypoints.each_with_index do |waypoint, i|
      route.waypoints << Waypoint.create(position: i, latitude: waypoint[0], longitude: waypoint[1])
    end
  end
end
