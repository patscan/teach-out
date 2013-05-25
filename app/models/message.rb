class Message < ActiveRecord::Base
  attr_accessible :content, :delivered, :header, :time_sent, :teacher_id, :subject
  belongs_to :teacher
  has_and_belongs_to_many :contacts
  has_and_belongs_to_many :students


end
