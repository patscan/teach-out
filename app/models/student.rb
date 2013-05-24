class Student < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :teacher_id
  belongs_to :teacher
end
