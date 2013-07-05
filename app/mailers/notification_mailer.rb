class NotificationMailer < ActionMailer::Base
  default from: "Notification@WhoRun.It"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.notify.subject
  #
  def notify(user,event)
    @event = event
    @user = user
    mail to: @user.email, subject: "New Event Notification!"
  end
end
