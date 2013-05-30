class StudentsController < ApplicationController

  def create
    student = current_user.students.build params[:student]
    if student.save
      render :json => {:success => true}
    else
      render :json => { :error => student.errors.full_messages.join("<br/>") }, :status => 422
    end
  end

  def show
  end

  def edit
    @student = Student.find(params[:id])
    @contact_student = ContactStudent.where("student_id = ?", @student.id)
  end

  def update
    student = Student.find(params[:id])
    if student.update_attributes(params[:student])
      render :js => "window.location='/teachers/dashboard'"
    else
      render :json => { :error => student.errors.full_messages.join("<br/>") }, :status => 422
    end
  end


  def destroy
    student = Student.find(params[:id])
    student.destroy
    redirect_to dashboard_teachers_path
  end

end
