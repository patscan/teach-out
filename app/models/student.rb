class Student < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :teacher_id
  belongs_to :teacher
  has_and_belongs_to_many :contacts
end
