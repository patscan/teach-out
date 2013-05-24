module MessagesHelper


  def twilio_client
    @twilio_client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])
  end

  def phone
    @phone = '+14159929905'
  end



end
