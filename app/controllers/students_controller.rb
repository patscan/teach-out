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
    # @student.save!
    #       puts "***contacts params*****"
    #   p params[:contacts_attributes]
    if @student
      @display = "Student Added"
      current_user.students << @student

      # @student.contacts <<  Contact.first_or_create(params[:contacts_attributes])
      Contact.first_or_create(params[:contacts_attributes])
      
      render :new
    else
      @display = @student.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
  end

  def delete
  end

  def search
  end
end
