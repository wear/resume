class LandingController < ApplicationController 
  include FaceboxRender
#  @trial_months = find(:all).group_by { |t| t.created_at.beginning_of_month }
#  arr_data = []
#  @trial_months.sort.each do |month, trials|
#    arr_data << [month.strftime('%B'),trials.size,month.strftime('%B')]
#  end           
  def index       
   # @asserts = Assert.find(:all,:limit => 10,:conditions => ['attachable_type = ?','Personalinfo'],:order => 'created_at DESC')
   @arr_data = [] 
   @resumes = Resume.find(:all,:limit => 300,:conditions =>"current IS NOT NULL").group_by { |t| t.current } 
      @resumes.sort.each do |current, r|
       @arr_data << [r.size,current]
     end
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
