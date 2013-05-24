class Message < ActiveRecord::Base
  attr_accessible :content, :delivered, :header, :time_sent, :teacher_id, :contacts_attributes
  belongs_to :teacher
  has_and_belongs_to_many :contacts

  accepts_nested_attributes_for :contacts
end
