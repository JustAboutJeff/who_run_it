class NotificationWorker
  include Sidekiq::Worker
  require 'sms_engine'
  sidekiq_options retry: false

  def perform(notification_queue = {})
    event = Event.find_by_id(notification_queue["event_id"])
  
    # Contact via email
    notification_queue["email"].each do |user_id|
      user = User.find_by_id(user_id)
      NotificationMailer.notify(user, event).deliver
    end

    # Contact via SMS
    notification_queue["text"].each do |user_id|
      user = User.find_by_id(user_id)
      my_sms_engine = SmsEngine.new(user, event)
      my_sms_engine.send_sms
    end
  end
end
