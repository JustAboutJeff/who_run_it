class EventsController < ApplicationController  
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(user_id: current_user.id,
                       title: params[:event][:title],
                       description: params[:event][:description],
                       hour: params[:hour],
                       minute: params[:minute],
                       ampm: params[:ampm],
                       pace: params[:event][:pace])
    @event.do_not_validate_route = true

    if @event.valid?
      @event.route = find_or_create_route
      @event.do_not_validate_route = false
      if @event.save
        redirect_to event_path(@event)
      else
        render 'new'
      end
    else
      render 'new'
    end
  end

  def show
    @event = Event.find_by_url_key(params[:id])
    redirect_to root_url, alert: "Event not found." unless @event
  end

  def destroy
    event = Event.find_by_url_key(params[:id])
    event.destroy
    redirect_to profile_path(current_user), alert: "Event deleted!"
  end

  private

  def find_or_create_route
    if params[:route] && (params[:waypoints] == "")
      Route.find(params[:route])
    else
      route = Route.create name: params[:event][:title], 
                           distance: meters_to_miles(params[:distance])

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
