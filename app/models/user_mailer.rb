class UserMailer < ActionMailer::Base    
  helper :application  
  
  def signup_notification(user)
    setup_email(user)
    @subject    += '请激活你的帐户'
    @body[:url]  = "#{APP_URL}/activate/#{user.activation_code}"
  end 
  
  def forgot_password(user,password)
    setup_email(user)   
    @subject    += '密码重设'  
    @body[:password]  = "#{password}"
    @body[:url]  = "#{APP_URL}"
  end
  
  def recommandition_request(resume,recipients,subject,body,role,code)
    @from        = "半亩塘"
    @subject     = "[半亩塘] "
    @sent_on     = Time.now
    @recipients  = recipients
    @body[:resume] = resume
    @body[:code] = code
    @body[:text] = body
    @body[:role] = role
    @subject += subject 
    @content_type = "text/html"
  end
  
  def send_resume(poster)
    @from        = "#{poster.resume.personalinfo.name} <support@muutang.com>"
    @sent_on     = Time.now
    @subject     = "求职申请 - (#{poster.position})"
    @recipients  = poster.email
    @body[:poster]  = poster
    @body[:resume]  = poster.resume
    @content_type = "text/html"
  end
  
  protected
    def setup_email(user)
      @recipients  = "#{user.login} <#{user.email}>"
      @from        = "半亩塘 <support@muutang.com>"
      @subject     = "[半亩塘] "
      @sent_on     = Time.now
      @body[:user] = user
      @content_type = "text/html"
    end 
    
end
