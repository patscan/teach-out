class ContactStudent < ActiveRecord::Base
  attr_accessible :active
  
  belongs_to :contact
  belongs_to :student
end
