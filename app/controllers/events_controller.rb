class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    coords = Geocoder.coordinates(params[:address])
    location = Location.create(latitude: coords[0],
                               longitude: coords[1])

    @event = Event.new(title: params[:event][:title],
                       description: params[:event][:description],
                       start_time: (Time.now + 3600),
                       location_id: location.id,
                       user_id: current_user.id)
    if @event.save
      # TODO: fine tune this to send out notifications to users accept the requirements
      User.all.each do |user|
        NotificationMailer.notify(user,@event).deliver
      end
      redirect_to events_path(@event)
    else
      redirect_to "/profile"
    end
  end

  def show
    unless @event = Event.find_by_url_key(params[:id])
      redirect_to root_url
    end
  end
end
