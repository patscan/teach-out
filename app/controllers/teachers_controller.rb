class TeachersController < ApplicationController
  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.create(params[:teacher])
    if @teacher.save?
      session[:id]=@teacher.id
      redirect_to root
    else
      @errors = @teacher.errors.full_messages
      render new ##take
    end
  end

  def dashboard

  end

end
