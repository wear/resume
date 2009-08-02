class LandingController < ApplicationController 
  include FaceboxRender
             
  def index
  #  @resumes = Resume.find(:all) 
  respond_to do |wants|
    if logged_in?
      wants.html { redirect_to resumes_path }
    else
      wants.html { }
    end
  end
  end  
  
  def help
    
  end
  
  def contact
    
  end 
  
  def jobs
    
  end
end
