class Contact < ActiveRecord::Base
  attr_accessible :email, :first_name, :language, :last_name, :phone_number, :relationship_to_student, :active
  has_and_belongs_to_many :messages
  has_and_belongs_to_many :students
end
