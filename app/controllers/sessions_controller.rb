class SessionsController < ApplicationController      
  include FaceboxRender                  
  
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
    if logged_in?
      if params[:remember_me] == "1"
        self.current_user.remember_me
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end
      flash.now[:notice] = '登录成功!'
      respond_to do |wants|
        wants.html { redirect_back_or_default(resumes_path) }
        wants.js { redirect_from_facebox(new_resume_path) }
      end
    else
      flash.now[:error] = '有错误发生！'
      respond_to do |wants|
        wants.html { 
#        redirect_to teaser_path and return if AppConfig.closed_beta_mode        
        render :action => 'new' }
        wants.js { 
          render :update do |page|
                page.replace_html 'login-box', :partial => 'sessions/login_box' 
          end
           }
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