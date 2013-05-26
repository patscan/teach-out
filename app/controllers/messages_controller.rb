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
    contacts_ids = []
    students.each do |student|
      student.generate_contact_list(message, contacts_ids)
    end

    job_ids = contacts_ids.map do |contact_id|
      TwilioWorker.perform_async(contact_id, message.id)
    end
    redirect_to dashboard_teachers_path
  end


  def schedule_new
    @students = Student.all  #refactor to only show students for current_user
    @message = Message.new
  end

  def schedule


  end

  def show
    @message = Message.find(params[:id])
  end
end

