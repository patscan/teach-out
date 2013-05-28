class SessionsController < ApplicationController

  def new
  end

  def create
    @teacher = Teacher.find_by_email(params[:session][:email])
    if @teacher && @teacher.authenticate(params[:session][:password])
      session[:id] = @teacher.id
      render :js => "window.location = '/teachers/dashboard'"
    else
      render :json => { :error => "Invalid email or password" }, :status => 422
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
