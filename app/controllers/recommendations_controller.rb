class RecommendationsController < ApplicationController 
  before_filter :login_required   
  before_filter :require_current_user
  before_filter :set_section
  before_filter :resume_created?
  
  def index
    @user = current_user
    @recommendations_by_role = @user.received_recommendations.group_by { |t| t.sender_role }
  end

  def show
  end
  
  def sent

  end     
  
  def new      
    @user = User.find params[:user_id] 
    @receiver = User.find(params[:receiver_id]) 
    @recommendation = Recommendation.new 
    respond_to do |wants|
      if @receiver.resume.nil? || @receiver.resume.roles.blank?
        flash[:error] = '对方还没有创建简历或填写工作/教育经历！'
        wants.html { redirect_to user_friendships_path(@user) }
      else
        wants.html {  } 
      end
    end
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
       Recommendation.transaction do            
       if @recommendation.save
         message = Message.new(:subject => "#{@user.resume_name}评价了你的表现",
         :body => "<p>#{@user.resume_name}评价了你的表现</p>-------------<br />他的评语<p>'#{@recommendation.desc}'</p>",
         :req_type => 'new_recommendation',:req_id => @recommendation.id)
         message.sender = @user
         message.recipient = @receiver
         message.save 
         flash[:notice] = '评价发送成功!' 
         wants.html { redirect_to sent_user_recommendations_path(@user) }
       else
         wants.html { render :action => "new" }  
       end
     end
     end
  end    
  
  def ask        
    @user = User.find params[:user_id]
#    @user.invitation_code = User.generate_new_password(8) 
#    @user.save!       
    generate_url
    respond_to do |wants| 
      if @user.resume.roles.blank? 
        flash[:error] = '你至少需要创建一项工作或教育记录来让别人评价!'
        wants.html{ redirect_to edit_resume_path(@user.resume)}
      else
        wants.html { }
      end
    end
  end
  
  def edit
    @recommendation = Recommendation.find(params[:id]) 
    @receiver =  @recommendation.receiver
  end
  
  def edit_visible
    @recommendation = Recommendation.find(params[:id])
    respond_to do |wants|
      wants.html {  }
    end
  end
  
  def visible
    @recommendation = Recommendation.find(params[:id])
    respond_to do |wants|  
    @recommendation.update_attributes(:visible => params[:visible])            
     flash[:notice] =  "操作成功！"  
     wants.html { redirect_to user_recommendations_path(@user) }
    end
  end  
  
  def update 
    @recommendation = Recommendation.find(params[:id])   
    @receiver = @recommendation.receiver 
    @user = User.find params[:user_id] 
   
    respond_to do |wants|  
     Recommendation.transaction do 
     if @recommendation.update_attributes(params[:recommendation])
       @recommendation.update_attributes(:visible => false)
       message = Message.new(:subject => "#{@user.resume_name}更新了对你的评价",
       :body => "<p>#{@user.resume_name}更新了对你的评价,请选择是否公开这份评价.</p>-------------<br />他的评语<p>'#{@recommendation.desc}'</p>",
       :req_type => 'new_recommendation',:req_id => @recommendation.id)
       message.sender = @user
       message.recipient = @recommendation.receiver
       message.save
       flash[:notice] = '推荐信息已更新'
       wants.html { redirect_to sent_user_recommendations_path(@user) }
     else  
       wants.html { render :action => "edit"  }
     end 
     end
    end 
  end
  
  def request_revised   
    @user = User.find params[:user_id]
    @recommendation = Recommendation.find(params[:id]) 
    Recommendation.transaction do
      @recommendation.update_attributes(:visible => params[:visible])
      message = Message.new(:subject => "#{@user.resume_name}请求你更新评价",:body => '<p>多谢你的评价,你能把评价更新下嘛?</p>' + "<p>--------原始推荐内容-------<br />'#{@recommendation.desc}'</p>",:req_type => 'edit_recommendation',:req_id => @recommendation.id)
      message.sender = @user
      message.recipient = @recommendation.sender
      message.save   
    end
    respond_to do |wants|  
      flash[:notice] = '请求已发送'
      wants.html { redirect_to user_recommendations_path(@user) }
    end
  end   
  
  def send_request
    emails = params[:emails]
     unless emails.nil? || params[:content].nil? 
      begin 
       subject = current_user.resume_name + "请你评价他的简历" 
       resume = current_user.resume                                      
       UserMailer.deliver_recommandition_request(resume,emails,subject,params[:content],generate_url)
       flash[:info] = '邮件已发送'  
      rescue
        flash[:error] = '有错误发送,可能email格式填写不对'
      end
       redirect_to edit_resume_path(@user.resume) 
     else      
       flash[:error] = '有错误发送,可能email格式填写不对'
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
  
  def resume_created?
    if @user.resume.nil? 
      flash[:notice] = '请先创建一份简历并填写基本个人信息!'
      redirect_to resumes_path
    end
  end
end
