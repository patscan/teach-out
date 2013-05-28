class Message < ActiveRecord::Base
  attr_accessible :content, :delivered, :header, :time_sent, :teacher_id, :subject, :sms_sid
  belongs_to :teacher
  has_many :contacts, :through => :contact_messages
  has_many :contact_messages
  has_and_belongs_to_many :students

  validates :content, :presence => true

  scope :delivered, where(:delivered  => true)
  scope :undelivered, where(:delivered  => false)

  def students_to
    self.students.pluck(:first_name).join(', ')
  end

  def sent_on
    self.time_sent.strftime("%m/%d/%y @ %H:%M")
  end
  
end
