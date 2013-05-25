class Student < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :teacher_id, :contacts_attributes
  belongs_to :teacher
  has_and_belongs_to_many :contacts
  has_and_belongs_to_many :messages

  accepts_nested_attributes_for :contacts

  validates_presence_of :first_name, :last_name
end
