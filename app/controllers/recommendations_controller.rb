class RecommendationsController < ApplicationController 
  before_filter :login_required   
  before_filter :require_current_user
  before_filter :set_section
  
  def index
    @user = current_user
  end

  def show
  end
  
  def sent

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
         flash[:notice] = '请求发送成功!' 
         wants.html { redirect_to sent_user_recommendations_path(@user) }
       else
         wants.html { render :action => "new" }  
       end
     end
  end    
  
  def ask     
    @user = User.find params[:user_id]
    @user.invitation_code = User.generate_new_password(8) 
    @user.save!       
    generate_url
    respond_to do |wants|
      wants.html { }
    end
  end
  
  def edit
    @recommendation = Recommendation.find(params[:id]) 
    @receiver =  @recommendation.receiver
  end
  
  def visible
       @recommendation = Recommendation.find(params[:id])
       @recommendation.update_attributes(:visible => params[:visible])
       respond_to do |wants|
        wants.html { redirect_to user_recommendations_path(@user) }
       end
  end  
  
  def update 
    @recommendation = Recommendation.find(params[:id])   
    @receiver = @recommendation.receiver 
    @user = User.find params[:user_id] 
   
    respond_to do |wants|
     if @recommendation.update_attributes(params[:recommendation])
       @recommendation.update_attributes(:visible => false)
       flash[:notice] = '推荐信息已更新'
       wants.html { redirect_to sent_user_recommendations_path(@user) }
     else  
       wants.html { render :action => "edit"  }
     end
    end 
  end
  
  def request_revised   
    
    @user = User.find params[:user_id]
    @recommendation = Recommendation.find(params[:id])
    @recommendation.update_attributes(:visible => params[:visible])
    message = Message.new(:subject => '更新对我的评价',:body => '<p>多谢你的评价,你能把评价更新下嘛?</p>' + "<p>--------原始推荐内容-------<br />'#{@recommendation.desc}'</p>",:req_type => 'edit_recommendation',:req_id => @recommendation.id)
    message.sender = @user
    message.recipient = @recommendation.sender
    message.save
    respond_to do |wants|  
      flash[:notice] = '请求已发送'
      wants.html { redirect_to user_recommendations_path(@user) }
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
    @invitation_code = APP_URL + '/signup?invitation_code=' + @user.invitation_code
  end
  
  def set_section
    @section = 'recommendation' 
  end
end
