# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  include AuthenticatedSystem     
  include ExceptionNotifiable
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  def render_group_header
    @render_group_header = true
  end
  
  def set_section(section)
    @section = section
  end                 
  
  def find_resume
    @resume = Resume.find(params[:resume_id] || params[:id]) || current_user.resume
    return false unless @resume
    return @resume
  end
  
  def require_current_user
    @user ||= User.find(params[:user_id] || params[:id] )
    unless (@user && (@user.eql?(current_user)))
      redirect_to :controller => 'sessions', :action => 'new' and return false
    end
    return @user
  end            
  

  def permission_denied
    flash[:notice] = "您无权限查看查看此命令"
    return redirect_to('/')
  end 
  
  def set_language
    request_language = @resume.lang
    I18n.locale = request_language if request_language && File.exist?("#{RAILS_ROOT}/config/locales/#{request_language}.yml")
  end

end
