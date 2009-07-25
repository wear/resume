class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead  
  before_filter :login_required,:only => [:show]
  
  def show
    @user = User.find params[:id]    
  end                                                                          

  # render new.rhtml
  def new
    @user = User.new 
    unless  params[:invitation_code].nil? && params[:resume].nil?
      session[:invitation_code] = params[:invitation_code]
      session[:invitation_resume] = params[:resume]
    end   
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty? 
      if find_code_and_resume &&  @user.become_friend_with(@friend) 
  
          message = Message.new
          message.subject = "#{@friend.profile.name}请求你评价他/她的简历" 
          message.body = '你的评价对我的简历十分重要,谢谢!' 
          message.sender = @friend
          message.recipient = @user
          message.save
        
        flash[:notice] = '已加好友'
        self.current_user = @user
        redirect_to new_resume_recommand_path(@resume)   
      else         
        self.current_user = @user
        redirect_back_or_default('/')
        flash[:notice] = "感谢注册!您已经可是使用本站全部功能！."
      end
    else
      flash[:error]  = "无法创建用户，可能填写的信息有误，请检查，抱歉!"
      render :action => 'new'
    end
  end

  
  def password
  end
  
  def change_password
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
      wants.html { render :layout => 'application' }
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
      render :action => "forgot_password",:layout => 'application'
    end
  end 
  
  protected
  
  def find_code_and_resume
    if session[:invitation_code] && session[:invitation_resume]
      @friend = User.find_by_invitation_code(session[:invitation_code])
      @resume = @friend.resumes.find(session[:invitation_resume])
    end 
  end
end
