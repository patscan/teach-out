class Student < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :teacher_id, :contacts_attributes
  belongs_to :teacher
  has_and_belongs_to_many :contacts
  has_and_belongs_to_many :messages

  accepts_nested_attributes_for :contacts
  validates_presence_of :first_name, :last_name

  def active_contacts
    self.contacts.select(&:active?)
  end

  def send_to_contacts(message)
    self.add_to_messages(message)
    self.active_contacts.each do |contact|
      contact.messages << message
      TwilioWorker.perform_async(contact.id, message.id)
    end
  end

  def schedule_to_contacts(message, interval)
    self.add_to_messages(message)
    self.active_contacts.each do |contact|
      contact.messages << message
      TwilioWorker.perform_at(interval, contact.id, message.id)
    end
  end
  
  def add_to_messages(message)
    self.messages << message
  end
end
