class StudentsController < ApplicationController
  
  def new
    @student = Student.new
    @student.contacts.build
    @relations = [["Parent", "Parent"], ["Guardian", "Guardian"]]
  end

  def create
    p params
    @student = Student.create(params[:student])
    current_user.students << @student
    Contact.first_or_create(params[:contacts_attributes])
    redirect_to dashboard_teachers_path
  end

  def show
  end

  def delete
  end

  def search
  end
end
