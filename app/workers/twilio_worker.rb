class TwilioWorker
  include Sidekiq::Worker
  include MessagesHelper
  sidekiq_options retry: 1

  def perform(contact_id, message_id)
    message = Message.find(message_id)
    message.update_attributes(time_sent: Time.now, delivered: true)
    contact = Contact.find(contact_id)
    response = twilio_client.account.sms.messages.create(from: app_phone, to: contact.phone_number, body: message.content)
    p response.sid
    message.update_attributes(sms_sid: response.sid)
  end

  def retries_exhausted(contact_id, message_id, *stuff)
    p stuff
    p contact_id
    p message_id
    p msg
    Message.find(msg['args'][1])
    message.delivered = false
    message.save
  end

end 