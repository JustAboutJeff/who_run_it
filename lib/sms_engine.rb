class SmsEngine
  def initialize(user, event)
    @user = user
    @event = event
  end

  def send_sms
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
      
    message = @client.account.sms.messages.create(:body => "New WhoRun.It Event In Your Area! #{@event.route.distance} miles at #{@event.pace} min/mile. #{@event.start_time.localtime.strftime("%I:%M%p")}. whorunit.herokuapp.com/#{@event.url_key}",
        :to => @user.cellphone,
        :from => ENV['TWILIO_PHONE_NUMBER'])
    puts message.sid
  end
end
