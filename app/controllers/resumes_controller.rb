class ResumesController < ApplicationController
  before_filter :login_required,:except => [:public,:index]
  before_filter :find_resume,:except => [:index,:new,:public,:create,:show]
  before_filter :set_language,:except =>  [:index,:new,:create,:public,:show]
 # caches_page :public
 # cache_sweeper :resume_sweeper,:only => [:create, :update, :destroy]
    
  include FaceboxRender 
  # GET /resumes
  # GET /resumes.xml
  def index   
    @section = 'resume'
  #  @resume = current_user.resume
    @resumes = Resume.paginate :conditions => ['current like ?',params[:query]],:page => params[:page], :per_page => 10
    respond_to do |format| 
        format.html { render :layout => 'landing'}
    end
  end 
  
  def send_to
    respond_to do |wants|
      wants.js {render_to_facebox(:template => 'resumes/send_to' ) }
    end
  end         
  
   
  def do_send
      @poster = @resume.poster.new(params[:poster])
      begin                                 
        @poser.save! || UserMailer.deliver_send_resume(@poster) 
        flash[:notice] = '邮件已发送'      
        redirect_to edit_resume_path(@resume)
      rescue
        flash[:error] = '有错误发送,可能email格式不对' 
      end
  end             
  
  
  def publish
     @resume.salt = Resume.generate_salt
     @resume.save
     
     respond_to do |format|
       format.html { }
       format.js  { }  
     end
  end 
  
  def public
      @resume = Resume.find(params[:id])    
      respond_to do |format|                        
       if @resume
         @user = @resume.user 
         set_language
         format.html { render :layout => 'resume'}
#         format.xml  { render :xml => @resume }
#         format.pdf { render :layout => false,
#             :prawnto => {:prawn => {
#                    :page_size => 'A4',
#                    :left_margin => 50,
#                    :right_margin => 50,
#                    :top_margin => 24,
#                    :bottom_margin => 24},:inline=> false,:filename => "#{@resume.name.gsub(' ','_')}.pdf"}} 
       else
         format.html { redirect_to login_path }
       end    
     end   
  end  
  
  def pdf
    make_and_send_pdf("file_name")
  end
  
  
  def edit_item
    @resume = Resume.find(params[:id])
    respond_to do |wants|
      wants.html {  }
    end
  end

  # GET /resumes/1
  # GET /resumes/1.xml
  def show          
    @section = 'resume' 
    @resume = Resume.find(params[:id])
    @user = @resume.user
    respond_to do |format|
      format.html {  }
    end
  end

  # GET /resumes/new
  # GET /resumes/new.xml
  def new
    @section = 'resume'  
    @resume = current_user.build_resume      
    respond_to do |format|
        format.html {}
    end
  end
       
  # GET /resumes/1/edit
  def edit    
    @section = 'resume'  
    respond_to do |wants| 
       wants.html {} 
     end
  end

  # POST /resumes
  # POST /resumes.xml
  def create
    @resume = current_user.build_resume(params[:resume])
    @resume.build_summary(:content => '暂无',:specialties => '暂无')
    @resume.build_additionalinfo(:interests => '暂无') 
 #   @resume.salt = Resume.generate_salt
    respond_to do |format|
      if @resume.save
        flash[:notice] = '简历创建成功!'
        format.html { redirect_to edit_resume_path(@resume) }
      else                 
        @section = 'resume' 
        format.html { render :action => 'new' }
      end 
    end
  end
  
  def recommands
  end

  # PUT /resumes/1
  # PUT /resumes/1.xml
  def update  
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
    @resume.destroy
    flash[:notice] = '删除成功!'
    respond_to do |format|
      format.html { redirect_to(resumes_url) }
      format.xml  { head :ok }
    end
  end  

end
