class AdminController < ApplicationController 
  before_filter :login_required
  access_control :DEFAULT => '(superuser)'

  def index
    @section = 'dash'
  end     
  
  def charts
    @section = 'chart'
  end
  
  def mail
    @section = 'mail' 
    @user = User.find 4
    respond_to do |wants|
      wants.html { render :layout => false }
    end 
  end
end
