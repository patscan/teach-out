class StudentsController < ApplicationController

  def new
    @student = Student.new
    @student.contacts.build
    @relations = [["Parent", "Parent"], ["Guardian", "Guardian"]]
  end

  def create
    contact = Contact.find_by_phone_number(params[:student][:contacts_attributes]["0"][:phone_number])
    if contact
      @student = Student.create(first_name: params[:student][:first_name], last_name: params[:student][:last_name])
      @student.contacts << contact
      current_user.students << @student
      redirect_to dashboard_teachers_path
    else
      @student = Student.create(params[:student])
      current_user.students << @student
      redirect_to dashboard_teachers_path
    end
  end

  def show
  end

  def delete
  end

  def search
  end
end
