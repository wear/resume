class SessionsController < ApplicationController      
  include FaceboxRender
  layout 'landing'                  
  
  def login_box 
    respond_to do |wants|
      wants.html { }
      wants.js  { render_to_facebox(:partial => 'sessions/login_box' ) }
    end
  end     
  
  def index
    redirect_to :action => "new"
  end  
  
  # render new.rhtml
  def new
    redirect_to user_path(current_user) and return if current_user
  end
 
  def create
    self.current_user = User.authenticate(params[:login], params[:password])
    respond_to do |wants|
    if logged_in?
      if params[:remember_me] == "1"
        self.current_user.remember_me
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end
    flash.now[:notice] = '登录成功!'
    wants.html { redirect_back_or_default resumes_path }
    else
    flash.now[:error] = '有错误发生！'
    wants.html { render :action => "new" } 
    end
    end
  end
  
 
  def destroy
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = '您已退出'
    redirect_to new_session_path
  end
  
 
end