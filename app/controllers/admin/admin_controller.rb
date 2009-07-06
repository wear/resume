class Admin::AdminController < ApplicationController 
  before_filter :login_required
  access_control :DEFAULT => 'superuser'
  
  def index
    @resume_size = Resume.count
    @user_size = User.count
  end
end
