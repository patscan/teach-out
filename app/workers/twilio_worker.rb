class TwilioWorker
  include Sidekiq::Worker
  include MessagesHelper
  sidekiq_options retry: false

  def perform(contact_id, message_id)
    message = Message.find(message_id)
    message.update_attributes(time_sent: Time.now, delivered: true)
    contact = Contact.find(contact_id)
    twilio_client.account.sms.messages.create(from: app_phone, to: contact.phone_number, body: message.content)
  end

end
