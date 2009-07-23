class ResumesController < ApplicationController
  before_filter :login_required,:except => :public
  # Todo : need view-able
  
  include FaceboxRender 
  # GET /resumes
  # GET /resumes.xml
  def index
    @user = current_user
    @resumes = @user.resumes

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @resumes }
    end
  end 
  
  def send_to
     @resume = Resume.find(params[:id]) 
    respond_to do |wants|
      wants.js {render_to_facebox(:template => 'resumes/send_to' ) }
    end
  end
   
  def do_send
    @resume = Resume.find(params[:id])  
    email = params[:email]
     unless email.nil? || params[:content].nil? || params[:job].nil?
      begin                                 
        UserMailer.deliver_send_resume(@resume,params[:job],email,params[:content]) 
        flash[:notice] = '邮件已发送'  
      rescue
        flash[:error] = '有错误发送,可能email格式不对'
      end
        redirect_to edit_resume_path(@resume)
     end
  end             
  
  
  def publish
     @resume = Resume.find(params[:id])   
     
     @resume.salt = Resume.generate_salt
     @resume.save
     
     respond_to do |format|
       format.html { }
       format.js  { }  
     end
  end 
  
  def public
      @resume = Resume.find_by_salt(params[:salt])  
     
     respond_to do |format|
       format.html { render :layout => 'resume'}
       format.xml  { render :xml => @resume }
       format.pdf { render :action => :show,:layout => false, :prawn => {
             :page_size => 'A4',
             :left_margin => 50,
             :right_margin => 50,
             :top_margin => 24,
             :bottom_margin => 24},
             :filename=>"#{@resume.profile.name.gsub(' ','_')}.pdf" }
     end   
  end

  # GET /resumes/1
  # GET /resumes/1.xml
  def show
    @resume = Resume.find(params[:id])  
    
    respond_to do |format|
      format.html { 
        if viewable?
          render :layout => 'resume'
        else
          flash[:error] = viewable?.to_s
          redirect_to '/' 
        end
        }
      format.pdf { 
         if viewable? 
            render :layout => false, :prawn => {
            :page_size => 'A4',
            :left_margin => 50,
            :right_margin => 50,
            :top_margin => 24,
            :bottom_margin => 24},
            :filename=>"#{@resume.profile.name.gsub(' ','_')}.pdf" 
          else
            flash[:error] = '您无权限查看此文件!'
            redirect_to '/' 
          end}
    end
  end

  # GET /resumes/new
  # GET /resumes/new.xml
  def new 
    @resume = current_user.resumes.new          
    respond_to do |format|
      if current_user.profile.nil?
        format.html { redirect_to new_user_profile_path(current_user) }
      else
        format.html {}
      end
    end
  end
       
  def edit_item
    @resume = current_user.resumes.find(params[:id]) 
    respond_to do |wants|
      wants.html {  }
    end
  end
  # GET /resumes/1/edit
  def edit
    @resume = Resume.find(params[:id])  
   unless current_user == @resume.user                        
       flash[:error] = '您无权限查看此文件!' 
      respond_to do |wants|
        wants.html { redirect_to '/' }
      end 
    end
  end

  # POST /resumes
  # POST /resumes.xml
  def create
    @resume = current_user.resumes.new(params[:resume])
    @resume.build_summary(:content => '暂无',:specialties => '暂无')
    @resume.build_additionalinfo(:interests => '暂无') 
    @resume.salt = Resume.generate_salt
    respond_to do |format|
      if @resume.save
        flash[:notice] = '简历创建成功.'
        format.html { redirect_to edit_resume_path(@resume) }
      else  
        format.html { render :action => "new" }
      end 
    end
  end
  
  def recommands
    @resume = Resume.find(params[:id]) 
  end

  # PUT /resumes/1
  # PUT /resumes/1.xml
  def update
    @resume =  current_user.resumes.find(params[:id])   
    respond_to do |format|
      if @resume.update_attributes(params[:resume])
        flash[:notice] = '简历更新成功.'
        format.html { redirect_to(edit_resume_path(@resume)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit_item" }
        format.xml  { render :xml => @resume.errors, :status => :unprocessable_entity }
      end
    end 
  end

  # DELETE /resumes/1
  # DELETE /resumes/1.xml
  def destroy
    @resume = current_user.resumes.find(params[:id])   
    
    @resume.destroy

    respond_to do |format|
      format.html { redirect_to(resumes_url) }
      format.xml  { head :ok }
    end
  end  
  

  
end
