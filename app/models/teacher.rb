class Teacher < ActiveRecord::Base
  attr_accessible :email, :first_name, :grade, :last_name, :password, :zip
  
  has_many :messages
  has_many :students

  validates_presence_of   :email, :first_name, :grade, :last_name, :password, :zip
  validates_uniqueness_of :email

  has_secure_password
end
