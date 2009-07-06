# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  include AuthenticatedSystem
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password            
            
  def user_autherized
    unless current_user == @resume.user
      flash[:error] = '您无权限查看此文件!'
      redirect_to '/'           
    end
  end   
  
  def find_resume
    @resume = Resume.find(params[:resume_id])
    user_autherized 
  end            
  

  def permission_denied
    flash[:notice] = "您无权限查看查看此命令"
    return redirect_to('/')
  end
  
end
