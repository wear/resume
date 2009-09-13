class LandingController < ApplicationController 
  include FaceboxRender
             
  def index
    @asserts = Assert.find(:all,:limit => 10,:conditions => ['attachable_type = ?','Personalinfo'])
  respond_to do |wants|
    if logged_in?
      wants.html { redirect_to current_user }
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
