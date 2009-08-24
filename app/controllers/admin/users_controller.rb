class Admin::UsersController < ApplicationController     
    layout 'admin'    
  def index       
    @section = 'admin_user' 
    @users = User.paginate :page => params[:page], :order => 'created_at DESC'
  end     
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
     
    flash[:notice] = '已成功删除'
    redirect_to admin_users_path
  end
  
end
