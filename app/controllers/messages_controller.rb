class MessagesController < ApplicationController

  def new
    @students = current_user.students.order(:first_name)
    @message = Message.new
  end

  def create
    p params
    message = Message.new(params[:message].merge(
      header: "From #{current_user.first_name.capitalize} #{current_user.last_name.capitalize}, #{current_user.school_name}"))
    message.time_sent = Time.now
    
    if params[:students]
      message.save
      students = Student.where :id => params[:students].values
      current_user.messages << message
      students.each { |student| student.send_to_contacts(message) }
      render :js => "window.location = '/teachers/dashboard'"
    else
      render :json => { :error => "You must have one student" }, :status => 422
    end
  end

  def schedule_new
    @students = current_user.students.order(:first_name)
    @message = Message.new
  end

  def schedule
    message = Message.new(params[:message].merge(
      header: "Sent from: #{current_user.first_name} #{current_user.last_name}, #{current_user.school_name}"))
    message.time_sent = Time.now
    message.save
    if params[:students] != nil
      students = Student.where :id => params[:students].values
      if message.save
        current_user.messages << message
        interval = parse_time(params['scheduled_for'], params["hour"], params["minute"], params["day_night"])
        students.each { |student| student.schedule_to_contacts(message, interval) }
        render :js => "window.location = '/teachers/dashboard'"
      else
        render :json => { :error => message.errors.full_messages.join("<br/>") }, :status => 422
      end
    else
      render :json => { :error => "You must have one student" }, :status => 422
    end
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

  Time.mktime(year, month, day, hour, minute, 0) + 7*60*60
end

