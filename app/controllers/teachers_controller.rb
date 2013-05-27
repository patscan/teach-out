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
      redirect_to dashboard_teachers_path
    else
      # @errors = @teacher.errors.full_messages
      return render :json => { :errors => @teacher.errors.full_messages }, :status => 422
      # render :new

      #render json errors
    end
  end

  def dashboard
    @teacher = current_user
    @students = current_user.students.order(:first_name)
    @messages = current_user.messages
    @messages_by_date = @messages.group_by {|m| m.time_sent.strftime("%Y-%m-%d") if m.time_sent}
    @sent_messages = @messages.delivered
    @unsent_messages = @messages.undelivered
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def show
    @teacher = current_user
    redirect_to dashboard_teachers_path
  end

end
