class ContactStudent < ActiveRecord::Base
  belongs_to :contact
  belongs_to :student
end
