class HomeController < ApplicationController
  
  def index
    @teacher = Teacher.new
  end

end
