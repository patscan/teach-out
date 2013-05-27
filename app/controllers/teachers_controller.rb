class TeachersController < ApplicationController
  def new
    @teacher = Teacher.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @teacher = Teacher.create(params[:teacher])
    if @teacher.save
      session[:id]=@teacher.id
      render :js => "window.location = '/teachers/dashboard'"
    else      
      render :json => { :error => @teacher.errors.full_messages.join("<br/>") }, :status => 422
    end
  end

  def dashboard
    @teacher = current_user
    @students = current_user.students.order(:first_name)

    messages = current_user.messages

    @messages_by_date = messages.group_by {|m| m.time_sent.strftime("%Y-%m-%d") if m.time_sent}

    @sent_messages = messages.delivered
    @last_sent_message = @sent_messages.sort_by! {|m| m.time_sent}.first

    @unsent_messages = messages.undelivered
    @last_unsent_message = @unsent_messages.sort_by! {|m| m.time_sent}.first


    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def show
    @teacher = current_user
    redirect_to dashboard_teachers_path
  end

end
