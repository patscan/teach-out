class ContactStudent < ActiveRecord::Base
  attr_accessible :active, :student
  
  belongs_to :contact
  belongs_to :student
end
