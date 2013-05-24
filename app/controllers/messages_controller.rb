class MessagesController < ApplicationController

  def new
    @students = Student.all  #refactor to only show students for current_user
    @message = Message.new

  end

  def create
    # @message = Message.create(params[:message])
    # current_user.messages << @message
    p params
    # twilio_client.account.sms.messages.create(from: app_phone, to: '+17143811795', 
    #   body: @message.content)
     redirect_to root_path
  end
end
