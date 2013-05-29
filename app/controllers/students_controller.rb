class StudentsController < ApplicationController

  def create
    contact = Contact.find_by_phone_number(params[:student][:contacts_attributes]["0"][:phone_number])
    if contact
      @student = Student.create(first_name: params[:student][:first_name], last_name: params[:student][:last_name])
      @student.contacts << contact
      current_user.students << @student
      if @student.errors.count > 0
        render :json => { :error => @student.errors.full_messages.join("<br/>") }, :status => 422
      else
        render :js => "window.location = '/teachers/dashboard'"
      end
    else
      @student = Student.create(params[:student])
      current_user.students << @student
      if @student.errors.count > 0
        render :json => { :error => @student.errors.full_messages.join("<br/>") }, :status => 422
      else
        render :js => "window.location = '/teachers/dashboard'"
      end
    end
  end

  def show
  end

  def edit
    @student = Student.find(params[:id])
    @contact_student = ContactStudent.where("student_id = ?", @student.id)
  end

  def update
    p params
    @student = Student.find(params[:id])
    @student.update_attributes(params[:student])
    p @student.errors.count
    if @student.errors.count > 0
      @errors = @student.errors.full_messages.join("<br/>") 
      render :edit
    else
      set_contact_active
      redirect_to dashboard_teachers_path
    end
  end


  def destroy
  
  end

  def search
  end

  private

  def set_contact_active
    # From phone number to new contact hash
    new_contacts = params["student"]["contacts_attributes"].
      select{|k, v| v["contact_students_attributes"].values.
        any?{|h| h["id"].nil?}}.values.index_by{|h| h['phone_number']}

    contacts = Contact.where(phone_number: new_contacts.keys).index_by(&:id)

    @student.contact_students.where(contact_id: contacts.keys).each do |cs|
      new_contact = new_contacts[contacts[cs.contact_id].phone_number]
      cs.active = new_contact["contact_students_attributes"]["0"]["active"] == "true"
      cs.save
    end
  end
end
