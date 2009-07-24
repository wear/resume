class UserMailer < ActionMailer::Base    
  helper :application  
  
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
  
  def recommandition_request(resume,recipients,subject,body,role,code)
    @from        = "半亩方塘"
    @subject     = "[半亩方塘] "
    @sent_on     = Time.now
    @recipients  = recipients
    @body[:resume] = resume
    @body[:code] = code
    @body[:text] = body
    @body[:role] = role
    @subject += subject 
    @content_type = "text/html"
  end
  
  def send_resume(resume,job,email,content)
    @from        = "半亩方塘"
    @subject     = "[半亩方塘] "
    @sent_on     = Time.now
    @subject    += "求职申请 - (#{job})"
    @recipients  = email
    @body[:resume]  = resume
    @body[:content]  = content
    @content_type = "text/html"
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
