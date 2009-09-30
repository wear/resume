class FriendshipsController < ApplicationController 
  before_filter :login_required
  before_filter :find_user
  
  def index
     @section = 'friendship'
  end 
  
  def create                                   
    @friend = User.find(params[:receiver])
    if @user.become_friend_with(@friend) 
      flash[:notice] = '操作成功!'
    else
       flash[:error] = '操作失败!'
     end
     respond_to do |wants|
       wants.html { redirect_to user_friendships_path(@user) } 
     end
  end
  
  protected
  def find_user
     @user = User.find(params[:user_id])
  end
end
