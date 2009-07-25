class RecommandsController < ApplicationController 
  before_filter :login_required   
  before_filter :find_resume
  
  def index
  end

  def show
  end

  def new
    @recommand = Recommendation.new
  end

  def create
  end    
  
  def ask 
    generate_url
  end    
  
  def send_request
    emails = params[:emails]
     unless emails.nil? || params[:subject].nil? || params[:content].nil?
      begin                                 
       UserMailer.deliver_recommandition_request(@resume,emails,params[:subject],params[:content],params[:role],generate_url)
       flash[:info] = '邮件已发送'  
      rescue
        flash[:error] = '有错误发送,可能email格式填写不对'
      end
       redirect_to edit_resume_path(@resume) 
     else      
       flash[:error] = '有错误发送,可能email格式填写不对2'
       render :action => "ask"
     end
  end
  
  protected
  def generate_url
    @invitation_code = APP_URL + '/signup?resume=' + "#{@resume.id}&" 'invitation_code=' + current_user.invitation_code
  end
end
