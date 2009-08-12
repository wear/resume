class MessageObserver < ActiveRecord::Observer
  def after_create(message)
    MessageMailer.deliver_message_notification(message)
  end
end
