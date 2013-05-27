class Contact < ActiveRecord::Base
  attr_accessible :email, :first_name, :language, :last_name, :phone_number, :relationship_to_student, :active
  has_and_belongs_to_many :messages
  has_and_belongs_to_many :students
  validates_presence_of :first_name, :last_name, :relationship_to_student, :phone_number
  
  validates :phone_number, :format => /1?-?\d{3}-?\d{3}-?\d{4}/


  def full_name
    self.first_name +" " + self.last_name
  end

end



