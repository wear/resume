class MessageMailer < ActionMailer::Base
  helper :application  
  
  def message_notification(message)
    setup_email(message)
    @subject    += message.subject
    @body[:url]  = "http://muutang.com/"
  end 

  protected
    def setup_email(message)
      @recipients  =  "#{message.recipient.login} <#{message.recipient.email}>"
      @from        = "#{message.sender.login} <#{message.sender.email}>"
      @subject     = "[半亩塘]你有新短消息:"
      @sent_on     = Time.now
      @body[:message] = message
      @content_type = "text/html"
    end

end
