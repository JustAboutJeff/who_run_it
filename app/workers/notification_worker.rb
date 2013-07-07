class NotificationWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(event_id)
    event = Event.find(event_id)
    event_coords = [event.waypoints.first.latitude, event.waypoints.first.longitude]

    User.all.each do |user|
      @sent = false
      user.location_settings.each do |location|
        break if @sent == true
        location_coords = [location.latitude, location.longitude]
        if Geocoder::Calculations.distance_between(event_coords, location_coords) <= 10
          NotificationMailer.notify(user,event).deliver
          @sent = true
        end
      end
    end

  end
end
