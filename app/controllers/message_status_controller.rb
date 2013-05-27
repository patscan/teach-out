class MessageStatusController < ApplicationController

  def create
    message = Message.find_by_sms_sid(params[:SmsSid])
    message.delivered = params[:SmsStatus] == "sent"
    message.save!
  end

end