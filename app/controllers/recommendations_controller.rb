class RecommendationsController < ApplicationController 
  before_filter :login_required   
  
  def index
    @user = current_user
  end

  def show
  end

  def new      
    @user = User.find params[:user_id] 
    @receiver = User.find(params[:receiver_id]) 
    @recommendation = Recommendation.new
  end 
  
  def select_role 
    @type = params[:type] 
  begin
    @resume = Resume.find(params[:resume_id]) 
  rescue
    @resume = nil
  end  
    respond_to do |wants|
      wants.js { render :layout => false }
    end
  end

  def create
     @sender = User.find params[:user_id]
     @receiver = User.find params[:receiver_id]
     @user = @sender
     @recommendation = Recommendation.new(params[:recommendation])
     @recommendation.sender = @sender
     @recommendation.receiver = @receiver
     respond_to do |wants|               
       if @recommendation.save  
         wants.html {  }
       else
         wants.html { render :action => "new" }  
       end
     end
  end    
  
  def ask      
    @resume = Resume.find(params[:resume_id]) 
    @user = User.find params[:user_id]
 #   @user.invitation_code = User.generate_new_password(8) 
 #   @user.save!       
    generate_url
    respond_to do |wants|
      wants.html { }
    end
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
    @invitation_code = APP_URL + '/signup?resume=' + "#{@resume.id}&" 'invitation_code=' + @user.invitation_code
  end
end
