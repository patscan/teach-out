class SessionsController < ApplicationController

  def new
  end

  def create
    @teacher = Teacher.find_by_email(params[:session][:email])
    if @teacher && @teacher.authenticate(params[:session][:password])
      session[:id] = @teacher.id
      redirect_to teachers_dashboard_path
    else
      @errors = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
