class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead  
  before_filter :login_required,:only => [:show,:public] 
  before_filter :find_resume,:only => [:show,:public]
  before_filter :require_current_user,:only => [:show]        
  
  def show
    @section = 'user'
    @user = User.find params[:id] 
    @invitation = @user.invitations.new   
  end                                                                          

  # render new.rhtml
  def new
    @user = User.new 
    find_code
    
    respond_to do |wants|
     if logged_in?     
      User.transaction do
        if find_friend && current_user.become_friend_with(@friend)
          flash[:notice] = "成功添加加#{@friend.resume_name}为好友!"            
          send_friendship_message(@friend,current_user)
        end
      end   
      wants.html  { redirect_to resumes_path }
    else
      wants.html { render :layout => 'landing' }
    end
    end
  end   
  
  
  def create
    logout_keeping_session!
    @user = User.new(params[:user])

    respond_to do |wants|
      User.transaction do
        if @user.save 
          flash[:notice] = "多谢您的注册!我们已向您的邮箱发送确认邮件,请注意查收！"    
          if find_friend && @user.become_friend_with(@friend) 
            send_friendship_message(@friend,@user) 
            flash[:notice] += "成功添加加#{@friend.resume.personalinfo.name}为好友!"  
          end   
          wants.html { redirect_to login_path }
        else    
          flash[:error] = '发现错误,请检查数据并重试'
          wants.html { render :action => 'new', :layout => 'landing' }
        end
      end 
    end
  end
  
  def public
    @user = User.find params[:id]
    respond_to do |wants|
      wants.html { render :layout => 'landing' }
    end
  end  
  
  def activate
    logout_keeping_session!
    user = User.find_by_activation_code(params[:activation_code]) unless params[:activation_code].blank?
    case
    when (!params[:activation_code].blank?) && user && !user.active?
      user.activate!
      flash[:notice] = "注册完成! 您现在就可以登录了."
    when params[:activation_code].blank?
      flash[:error] = "验证码缺失.请使用确认邮件中的url地址."
    else 
      flash[:error]  = "此验证码无效,请检查确认邮件,或者重新注册?."
    end
    redirect_to login_path
  end

  
  def password
    @section = 'password'
    @user = User.find(params[:id])
  end
  
  def change_password  
    @user = User.find(params[:id])
     respond_to do |format|
       if User.authenticate(@user.login, params[:user][:current_password])
 	      if @user.update_attributes(:password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation])
 	      flash[:notice] = "密码修改成功！"
 	      format.html { redirect_to user_path(@user) }
 	     else
 	      format.html { render :action => 'password' }
 	    end
      else
 	     @user.errors.add_to_base("现密码不正确")
 	     format.html { render :action => 'password' }
      end
    end
  end
  
  def forgot_password
    respond_to do |wants|
      wants.html { render :layout => 'landing' }
    end
  end
  
  def reset_password
    @user = User.find(:first,:conditions => ['email = ? and login = ? ',params[:email],params[:login]])
    if @user
      new_password = User.generate_new_password
      @user.password = new_password
      @user.password_confirmation = new_password
      @user.save
      UserMailer.deliver_forgot_password(@user, new_password)
      cookies.delete :auth_token
      reset_session
      flash[:notice] = "新密码已发送到#{@user.email}!" 
      redirect_to root_url
    else
      flash.now[:error] = '填写信息有误，请重试!'
      render :action => "forgot_password",:layout => 'landing'
    end
  end 
  
  
  protected
  
  def find_code
    unless  params[:invitation_code].nil? 
      session[:invitation_code] = params[:invitation_code] 
    end 
  end
  
  def find_friend
     @friend = User.find_by_invitation_code(session[:invitation_code])  if  session[:invitation_code]
  end
  
  def send_friendship_message(sender,receiver)
    message = Message.new(:subject => "#{sender.resume_name}请你推荐他/她",:body => "<p>你的评价对我将十分重要，多谢!<p><p>#{sender.resume_name}",:req_type => 'recommendation')
    message.sender = sender
    message.recipient = receiver
    message.save
  end
end
