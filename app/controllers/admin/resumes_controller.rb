class Admin::ResumesController < ApplicationController   
  before_filter :login_required
  access_control :DEFAULT => 'superuser'
  
  def index
     @resumes = Resume.paginate :page => params[:page], :order => 'created_at DESC'
  end 
  
  def show
    @resume =  Resume.find(params[:id]) 
    respond_to do |wants|
      wants.html { render :template => '/resumes/show',:layout => 'resume' }
    end
  end
  
end
