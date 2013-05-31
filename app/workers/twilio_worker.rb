class TwilioWorker
  include Sidekiq::Worker
  include MessagesHelper
  sidekiq_options retry: 1

  def perform(contact_id, message_id)
    message = Message.find(message_id)
    message.update_attributes(time_sent: Time.now)
    contact_message = ContactMessage.where("message_id = ? AND contact_id = ?", message_id, contact_id).first
    contact_message.update_attributes(delivered: true)
    contact = Contact.find(contact_id)
    response = twilio_client.account.sms.messages.create(from: app_phone, 
                                                         to: contact.phone_number,
                                                         body: message.content,
                                                         status_callback: "http://ancient-shore-3226.herokuapp.com/status")
    p response
    contact_message.update_attributes(sms_sid: response.sid)
  end

  def retries_exhausted(contact_id, message_id)
    Message.find(message_id)

    contact_message = ContactMessage.where("message_id = ? AND contact_id = ?", message_id, contact_id).first
    contact_message.update_attributes(delivered: false)

    contact_message.save
  end

end 
