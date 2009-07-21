class RecommandsController < ApplicationController 
  before_filter :login_required   
  before_filter :find_resume
  
  def index
  end

  def show
  end

  def new
    @position = Position.find(params[:position_id])
  end

  def create
  end    
  
  def ask
  end    
  
  def send_request
    
  end

end
