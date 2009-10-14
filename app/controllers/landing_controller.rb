class LandingController < ApplicationController 
 # include FaceboxRender  
      
  before_filter :redirect_if_logged_in,:only => [:index]   
       
  def index     
    @fetured_resumes = Resume.find([174,96,153,140,129])
#    @arr_data = [] 
#    @resumes = Resume.find(:all,:limit => 300,:conditions =>"current IS NOT NULL").group_by { |t| t.current } 
#    @resumes.sort.each do |current, r|
#       @arr_data << [r.size,current]
#    end
    respond_to do |wants|
      wants.html {  }
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
  
  protected
  
  def redirect_if_logged_in 
    if logged_in?
      redirect_to current_user 
    end
  end 
  
end
