class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    miles = (params[:distance].to_f*0.000621371).round(2)

    if params[:route] && (params[:waypoints] == "")
      @route = Route.find(params[:route])
    else
      @route = Route.create(name: params[:event][:title], distance: miles)
      @waypoints = params[:waypoints].split(",").each_slice(2).to_a
      @waypoints.each_with_index do |waypoint, i|
        @route.waypoints << Waypoint.create(position: i, latitude: waypoint[0], longitude: waypoint[1])
      end
    end

    time = Event.generate_time(params[:hour], params[:minute], params[:ampm])

    @event = Event.new(user_id: current_user.id,
                       title: params[:event][:title],
                       description: params[:event][:description],
                       route_id: @route.id,
                       start_time: time,
                       pace: params[:event][:pace])

    if @event.save
      NotificationWorker.perform_async(@event.id)
      redirect_to event_path(@event)
    else
      redirect_to "/profile"
    end
  end

  def show
    unless @event = Event.find_by_url_key(params[:id])
      redirect_to root_url
    end
    @waypoints = []
    @event.waypoints.each do |waypoint|
      @waypoints << [waypoint.latitude, waypoint.longitude]
    end
  end
end
