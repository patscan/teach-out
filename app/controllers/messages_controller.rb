class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.create(params[:message])
    # current_user.messages << @message
    twilio_client.account.sms.messages.create(from: app_phone, to: '+17143811795', 
      body: @message.content)
    redirect_to new_message_path 
  end

end
