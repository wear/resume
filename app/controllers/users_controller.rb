class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
                                                                            

  # render new.rhtml
  def new
    @user = User.new
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
      redirect_back_or_default('/')
      flash[:notice] = "感谢注册!我们给您的注册邮箱发了验证邮件，请查收."
    else
      flash[:error]  = "无法创建用户，可能填写的信息有误，请检查，抱歉!"
      render :action => 'new'
    end
  end

  def activate
    logout_keeping_session!
    user = User.find_by_activation_code(params[:activation_code]) unless params[:activation_code].blank?
    case
    when (!params[:activation_code].blank?) && user && !user.active?
      user.activate!
      flash[:notice] = "帐户激活，注册完成，请登录."
      redirect_to '/login'
    when params[:activation_code].blank?
      flash[:error] = "验证码无效."
      redirect_back_or_default('/')
    else 
      flash[:error]  = "您已激活，请尝试登录."
      redirect_back_or_default('/')
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
end
