class Teacher < ActiveRecord::Base
  attr_accessible :email, :first_name, :grade, :last_name, :password, :zip
  has_many :messages
  has_many :students
end
