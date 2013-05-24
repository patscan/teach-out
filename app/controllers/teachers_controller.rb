class TeachersController < ApplicationController
  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.create(params[:teacher])
    if @teacher.save
      session[:id]=@teacher.id
      redirect_to teachers_dashboard_path
    else
      @errors = @teacher.errors.full_messages
      render :new 
    end
  end

  def dashboard
    @teacher = current_user
    @students = current_user.students
    @messages = current_user.messages
    @messages_by_date = @messages.group_by {|m| m.time_sent.strftime("%Y-%m-%d")}
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def show
    @teacher = current_user
    redirect_to teachers_dashboard_path
  end

end
