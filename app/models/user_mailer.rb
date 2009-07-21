class UserMailer < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject    += '你的帐户信息'
    @body[:url]  = "http://muutang.com/"
  end 
  
  def forgot_password(user,password)
    setup_email(user)
    @subject    += '密码重设'  
    @body[:password]  = "#{password}"
    @body[:url]  = "http://muutang.com/"
  end
  
  def recommandition_request(recipients,subject,body)
    @recipients  = recipients
    @from        = "半亩方塘"
    @subject     = "[半亩方塘] - #{subject}"
    @sent_on     = Time.now
    @body[:text]  = body
  end
  
  protected
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "半亩方塘"
      @subject     = "[半亩方塘] "
      @sent_on     = Time.now
      @body[:user] = user
    end
end
