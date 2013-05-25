class MessagesController < ApplicationController

  def new
    @students = Student.all  #refactor to only show students for current_user
    @message = Message.new
  end

  def create
    message = Message.create(params[:message].merge(
      header: "Sent from: #{current_user.first_name} #{current_user.last_name}, #{current_user.school_name}"))
    students = Student.where :id => params[:students].values
    current_user.messages << message
    contacts = []
    students.each do |student|
      student.messages << message
      student.contacts.where("active=?", true).each do |contact|
        contact.messages << message
        contacts << contact
      end
    end
    contacts.each do |contact|
      twilio_client.account.sms.messages.create(from: app_phone, to: contact.phone_number, 
        body: message.content)
    end
    redirect_to dashboard_teachers_path
  end

  def show
    @message = Message.find(params[:id])
  end
end

