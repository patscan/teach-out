class Message < ActiveRecord::Base
  attr_accessible :content, :delivered, :header, :time_sent, :teacher_id
  belongs_to :teacher
  has_and_belongs_to_many :contacts

end
