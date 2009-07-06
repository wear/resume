class Admin::UsersController < ApplicationController     
  before_filter :login_required
  access_control :DEFAULT => 'superuser'
  
  def index
    @users = User.paginate :page => params[:page], :order => 'created_at DESC'
  end
end
