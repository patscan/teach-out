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
    @teacher = Teacher.find(current_user.id)
    @students = @teacher.students
  end

  def show
    @teacher = Teacher.find(session[:id])
    redirect_to teachers_dashboard_path
  end

end
