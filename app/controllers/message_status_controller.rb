class StatusController < ApplicationController

  def champagne_callback
    contact_message = ContactMessage.find_by_sms_sid(params[:SmsSid])
    contact_message.delivered = params[:SmsStatus] == "sent"
    Message.find(contact_message.message_id).time_sent = Time.now
    contact_message.save!
  end

end
