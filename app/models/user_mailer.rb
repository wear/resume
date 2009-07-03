class UserMailer < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject    += '请激活你的帐户'
    @body[:activate_url]  = "http://muutang.com/activate/#{user.activation_code}" 
    @body[:url]  = "http://muutang.com/"
  end 
  
  def forgot_password(user,password)
    setup_email(user)
    @subject    += '密码重设'  
    @body[:password]  = "#{password}"
    @body[:url]  = "http://muutang.com/"
  end
  
  def activation(user)
    setup_email(user)
    @subject    += '你的帐户已激活!'
    @body[:url]  = "http://muutang.com/"
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
