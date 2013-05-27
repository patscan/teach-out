class Teacher < ActiveRecord::Base
  attr_accessible :email, :first_name, :grade, :last_name, :password, :zip, :school_name, :title
  
  has_many :messages
  has_many :students

  validates_presence_of   :email, :first_name, :grade, :last_name, :password_digest, :zip
  validates_uniqueness_of :email
  validates :email, :format => { :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/}
  validates :password, :length => { :minimum => 5 }

  has_secure_password


end
