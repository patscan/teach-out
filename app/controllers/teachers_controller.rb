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
    @message = Message.new #for displaying in the modal
    # - refactor - locals: true?
    @student = Student.new
    @student.contacts.build

    @students = current_user.students.order(:first_name)

    messages = current_user.messages
    ids = messages.pluck(:id)
    contact_messsages = ContactMessage.delivered.where(:message_id => ids)
    @sent_messages = messages

    @messages_by_date = messages.group_by do |m| 
      m.time_sent.strftime("%Y-%m-%d") if m.time_sent
    end
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def render_calendar ##route for async date changing
    string_date = params[:month]
    year, month = string_date.split('-')
    @date = Date.new(year.to_i, month.to_i)
    @messages_by_date = current_user.messages.group_by do |m| 
      m.time_sent.strftime("%Y-%m-%d") if m.time_sent
    end

    calendar = render_to_string(:partial => "shared/calendar", :layout => false, :locals => {:date => @date, :messages_by_date => @messages_by_date})
    render :json => {:calendar => calendar}
  end

  def render_single_day
    date = params[:date]
    @day_messages = current_user.messages.select do |m|
      m.time_sent if m.time_sent == date
    end
    single_day = render_to_string(:partial => "shared/single_day", :layout => false, :locals => {:day_messages => @day_messages})
    render :json => {:single_day => single_day}
  end

  def show
    @teacher = current_user
    redirect_to dashboard_teachers_path
  end

end
