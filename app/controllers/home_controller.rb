class HomeController < ApplicationController
  
  def index
    @teacher = Teacher.new
    render :index, :layout => "splash"
  end

  def show
    render :about
  end

end
