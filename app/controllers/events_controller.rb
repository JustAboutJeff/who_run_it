class EventsController < ApplicationController  
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(user_id: current_user.id,
                       title: params[:event][:title],
                       description: params[:event][:description],
                       start_time: time,
                       pace: params[:event][:pace])
    @event.do_not_validate_route = true

    if @event.valid:?
      # create routes and waypoints
      # @event.route = ...
      # @wevent.do_not_validate_rooute = false

      if @event.save
        # ... add route error to object
        # redirect
      else
        render :new
      end

      # go create way ppoints and routes
      # ...
    else
      render :new
    end

    # HANDLE VALIDATIONS SO IT DOESNT CHECK FOR ROUTE ID YET

    @route = find_or_create_route

    #time = Event.generate_time(params[:hour], params[:minute], params[:ampm])
    # PUT THIS IN EVENT MODEL

    if @event.save
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  def show
    @event = Event.find_by_url_key(params[:id])
    redirect_to root_url unless @event
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
