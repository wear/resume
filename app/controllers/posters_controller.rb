class PostersController < ApplicationController 
  before_filter :login_required   
  before_filter :find_resume
  
  def index 
    @section = 'resume'
  end 
  
  def preview 
    @section = 'resume'       
    @poster = params[:poster]
    respond_to do |wants|
      wants.js { render :partial => "/shared/mail" }
    end
  end

  def new  
    @section = 'resume'
    @poster = Poster.new
  end

  def create
    @poster = @resume.posters.new(params[:poster])
      respond_to do |wants| 
      begin @poster.save! && UserMailer.deliver_send_resume(@poster)
        flash[:notice] = '简历发送成功'
        wants.html { redirect_to @resume }
      rescue  
        wants.html { render :action => "new"  }
      end
    end 
  end

end
