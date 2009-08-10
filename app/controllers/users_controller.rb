class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead  
  before_filter :login_required,:only => [:show,:public]
  
  def show
    @section = 'profile'
    @user = User.find params[:id]    
  end                                                                          

  # render new.rhtml
  def new
    @user = User.new 
    find_code                                        
    
    respond_to do |wants|
      wants.html { render :layout => 'landing' }
    end
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty? 
      if find_friend &&  @user.become_friend_with(@friend)   
        message = Message.new(:subject => '求求你评价我',:body => '不评价我就砍死你',:req_type => 'recommendation')
        message.sender = @friend
        message.recipient = @user
        message.save      
        flash[:notice] = '注册成功!为了严肃评价,请先填写个人信息'
      else             
        flash[:notice] = "感谢注册!您现在就可以开始创建您的简历了."
      end                
      session[:user_id] = @user
      redirect_to resumes_path
    else
      flash[:error]  = "无法创建用户，可能填写的信息有误，请检查，抱歉!"
      render :action => 'new',:layout => 'landing'
    end
  end
  
  def public
    @user = User.find params[:id]
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
  
  def find_code
    unless  params[:invitation_code].nil? 
      session[:invitation_code] = params[:invitation_code]
    end 
  end
  
  def find_friend
    unless  session[:invitation_code].nil?
      @friend = User.find_by_invitation_code(session[:invitation_code])
    end
  end
end
