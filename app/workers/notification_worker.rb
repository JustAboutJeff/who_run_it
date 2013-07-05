class NotificationWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(event_id)
    event = Event.find(event_id)
    User.all.each do |user|
      NotificationMailer.notify(user,event).deliver
    end
  end
end