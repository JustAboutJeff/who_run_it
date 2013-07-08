class NotificationWorker
  include Sidekiq::Worker
  require 'sms_engine'
  sidekiq_options retry: false

  def perform(event_id)    
    event = Event.find(event_id)
    event_coords = [event.waypoints.first.latitude, event.waypoints.first.longitude]

    User.all.each do |user|
      sent_email = false
      sent_text = false
      user.location_settings.each do |location|
        if (event.pace >= location.pace_min) && (event.pace <= location.pace_max)
          if (event.route.distance >= location.distance_min) && (event.route.distance <= location.distance_max)
            location_coords = [location.latitude, location.longitude]
            if Geocoder::Calculations.distance_between(event_coords, location_coords) <= 10
              if (location.notification_method == "2") || (location.notification_method == "4")
                break if sent_email == true
                NotificationMailer.notify(user,event).deliver
                sent_email = true
              end

              if (location.notification_method == "3") || (location.notification_method == "4")
                break if sent_text == true
                my_sms_engine = SmsEngine.new(user, event)
                my_sms_engine.send_sms
                sent_text = true
              end
            end
          end
        end
      end
    end
  end
end
