class Student < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :teacher_id, :contacts_attributes
  belongs_to :teacher
  has_many :contacts, :through => :contact_students
  has_many :contact_students, :dependent => :destroy
  has_and_belongs_to_many :messages

  accepts_nested_attributes_for :contacts
  validates_presence_of :first_name, :last_name


  # comment the shit out of this.
  # student without any contact
  # student.contacts.build :first_name, etc. (attributes_for(:contact))
  #expect {
    #student.autosave_associated_records_for_contacts  
  #}.to change(student.contacts, :count).by(1) change
  

  def active_contacts
    # self.contacts.select(&:active?)
    contact_ids = self.contact_students.where("active = ?", true).pluck(:contact_id)
    contacts = Contact.where :id => contact_ids
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
    message.update_attributes(:time_sent => interval) 
    self.active_contacts.each do |contact|
      contact.messages << message
      TwilioWorker.perform_at(interval, contact.id, message.id)
    end
  end
  
  def add_to_messages(message)
    self.messages << message
  end

  private
  def autosave_associated_records_for_contacts
    self.contacts.each do |contact|

      if contact.id == nil
        existing_contact = Contact.find_by_phone_number(contact.phone_number)
        if existing_contact
          self.contacts.delete(contact)
          self.contacts << existing_contact
        else
          self.contacts << contact
          contact.save!
        end
      else
        contact.save!
      end
    end
  end
end
