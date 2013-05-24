class MessagesController < ApplicationController

  def new
    @students = Student.all  #refactor to only show students for current_user
    @message = Message.new
  end

  def create
    contacts = Contact.where :id => params["recipients"].values
    message = Message.create(params[:message])
    current_user.messages << message
    contacts.each do |contact|
      contact.messages << message
    end
    contacts.each do |contact|
      twilio_client.account.sms.messages.create(from: app_phone, to: contact.phone_number, 
        body: message.content)
    end
      redirect_to root_path
  end
end
