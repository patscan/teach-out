class Contact < ActiveRecord::Base
  attr_accessible :email, :first_name, :language, :last_name, :phone_number, :relationship_to_student, :active
  has_many :messages, :through => :contact_messages
  has_many :contact_messages
  has_and_belongs_to_many :students
  validates_presence_of :first_name, :last_name, :relationship_to_student, :phone_number
  validates_inclusion_of :language, :in => lambda{ |contact| Contact.valid_languages}
  validates_inclusion_of :relationship_to_student, :in => lambda{|contact| Contact.valid_relations}

  validates :phone_number, :format => /1?-?\d{3}-?\d{3}-?\d{4}/

  def full_name
    self.first_name +" " + self.last_name
  end

  def self.valid_relations
    [
      "Mother",
      "Father",
      "Guardian",
      "Grandmother",
      "Grandfather",
      "Aunt",
      "Uncle"
    ]
  end

  def self.valid_languages
    [
      "English",
      "Spanish",
      "Chinese",
      "Tagalog",
      "Japanese",
      "French",
      "German", 
    ]
  end

end
