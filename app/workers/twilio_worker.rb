class TwilioWorker
  include Sidekiq::Worker
  include MessagesHelper
  sidekiq_options retry: false

  def perform(contacts_ids, message_id)
    message = Message.find(message_id)
    contacts = Contact.where :id => contacts_ids
    contacts.each do |contact|
      twilio_client.account.sms.messages.create(from: app_phone, to: contact.phone_number, 
        body: message.content)
    end
  end

end
