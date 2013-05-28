class ContactMessage < ActiveRecord::Base
  attr_accessible :delivered, :sms_sid

  belongs_to :contact
  belongs_to :message

  scope :delivered, where("delivered = ?", true)

end
