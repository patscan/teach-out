class MessagesController < ApplicationController

  def new
    @students = current_user.students.order(:first_name)
    @message = Message.new
  end

  def create
    message = Message.new(params[:message].merge(
      header: "From #{current_user.first_name.capitalize} #{current_user.last_name.capitalize}, #{current_user.school_name}"))
    message.time_sent = Time.now
    message.delivered = true
    message.save!
    current_user.messages << message

    students = Student.where :id => params[:students].values
    students.each { |student| student.send_to_contacts(message) }
    
    redirect_to dashboard_teachers_path
  end

  def schedule_new
    @students = current_user.students.order(:first_name)
    @message = Message.new
  end

  def schedule
    message = Message.create(params[:message].merge(
      header: "Sent from: #{current_user.first_name} #{current_user.last_name}, #{current_user.school_name}"))
    students = Student.where :id => params[:students].values
    current_user.messages << message
    contacts_ids = []
    students.each do |student|
      student.generate_contact_list(message, contacts_ids)
    end

    interval = parse_time(params['scheduled_for'], params["hour"], params["minute"], params["day_night"])
    job_ids = contacts_ids.map do |contact_id|
      TwilioWorker.perform_at(interval, contact_id, message.id)
    end
    p job_ids
    redirect_to dashboard_teachers_path
  end

  def show
    @message = Message.find(params[:id])
  end
end

private

def parse_time(date, hour, minute, day_night)
  month_day_year = date.split("/")
  year = month_day_year[2]
  month = month_day_year[0]
  day = month_day_year[1]
  hour = hour.to_i + 12 if day_night == "pm"

  p Time.mktime(year, month, day, hour, minute, 0)
end

