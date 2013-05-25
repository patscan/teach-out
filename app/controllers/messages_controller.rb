class MessagesController < ApplicationController

  def new
    @students = Student.all  #refactor to only show students for current_user
    @message = Message.new
  end

  def create

    students = Student.where :id => params[:students].values
    students.each do |student|
      

    # message = Message.create(params[:message].merge(
    #   header: "Sent from: #{current_user.first_name} #{current_user.last_name}, #{current_user.school_name}"))
    # current_user.messages << message
    # contacts.each do |contact|
    #   contact.messages << message
    # end
    # contacts.each do |contact|
    #   twilio_client.account.sms.messages.create(from: app_phone, to: contact.phone_number, 
    #     body: message.content)
    # end
  end
  redirect_to dashboard_teachers_path
end

end

