class Student < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :teacher_id, :contacts_attributes
  belongs_to :teacher
  has_and_belongs_to_many :contacts
  has_and_belongs_to_many :messages

  accepts_nested_attributes_for :contacts

  def active_contacts
    self.contacts.where("active=?", true)
  end

  def generate_contact_list(message, array)
    
    self.messages << message
    self.active_contacts.each do |contact|
        contact.messages << message
        array << contact.id
    end
  end

end


