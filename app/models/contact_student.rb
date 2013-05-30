class ContactStudent < ActiveRecord::Base
  attr_accessible :active, :student, :contact
  
  belongs_to :contact
  belongs_to :student
end
