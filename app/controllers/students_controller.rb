class StudentsController < ApplicationController
  
  def new
    @student = Student.new
    @student.contacts.build
    @relations = [["Mother", "Mother"],
                  ["Father", "Father"], 
                  ["Guardian", "Guardian"],
                  ["Grandmother", "Grandmother"], 
                  ["Grandfather", "Grandfather"], 
                  ["Aunt", "Aunt"], 
                  ["Uncle", "Uncle"]]
    @languages = [["English", "English"], 
                  ["Spanish","Spanish"], 
                  ["Chinese", "Chinese"], 
                  ["Tagalog", "Tagalog"], 
                  ["Japanese", "Japanese"], 
                  ["French", "French"], 
                  ["German", "German"]]
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
