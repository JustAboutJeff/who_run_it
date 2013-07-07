class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    miles = (params[:distance].to_f*0.000621371).round(2)

    @route = Route.create(name: params[:event][:title], distance: miles)

    @waypoints = params[:waypoints].split(",").each_slice(2).to_a
    @waypoints.each_with_index do |waypoint, i|
      @route.waypoints << Waypoint.create(position: i, latitude: waypoint[0], longitude: waypoint[1])
    end

    # time = Event.generate_time(params[:hour], params[:minute], params[:ampm])

    p '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
    p params[:crazy]
    # p time
    # p time.class

    @event = Event.new(user_id: current_user.id,
                       title: params[:event][:title],
                       description: params[:event][:description],
                       route_id: @route.id,
                       start_time: (params[:crazy]),
                       pace: params[:event][:pace])

    if @event.save
      # TODO: send out notifications only to users that accept the settings
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
