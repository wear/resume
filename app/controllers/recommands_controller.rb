class RecommandsController < ApplicationController 
  before_filter :login_required   
  before_filter :find_resume
  
  def index
  end

  def show
  end

  def new
    @position = Position.find(params[:position_id])
  end

  def create
  end    
  
  def ask 
    @invitation_code = APP_URL + 'signup?invitation_code=' + @resume.user.invitation_code
  end    
  
  def send_request
    emails = params[:emails]
     unless emails.nil? || params[:subject].nil? || params[:content].nil?
    #   begin                                 
         flash[:error] = '邮件已发送'
         UserMailer.deliver_recommandition_request(emails,params[:subject],params[:content])
    #   rescue
    #     flash[:error] = '有错误发送,可能email格式填写不对'
    #   end
       redirect_to edit_resume_path(@resume) 
     else      
       flash[:error] = '有错误发送,可能email格式填写不对2'
       render :action => "ask"
     end
  end

end
