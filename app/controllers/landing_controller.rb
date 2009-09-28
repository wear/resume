class LandingController < ApplicationController 
  include FaceboxRender
             
  def index       
    @asserts = Assert.find(:all,:limit => 10,:conditions => ['attachable_type = ?','Personalinfo'],:order => 'created_at DESC')
  respond_to do |wants|
    if logged_in?
      wants.html { redirect_to current_user }
    else
      wants.html { }
    end
  end
  end 
  
  def search   
     query = params[:query]
     @resumes = Resume.find(:all,:conditions => ["name LIKE ? ",query])
  end 
  
  def help
    
  end
  
  def contact
    
  end 
  
  def jobs
    
  end
end
