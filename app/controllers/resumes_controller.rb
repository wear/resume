class ResumesController < ApplicationController
  before_filter :login_required,:except => :public
  
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
  
  def publish
     @resume = Resume.find(params[:id])  
     if current_user == @resume.user  
     
     @resume.salt = Resume.generate_salt
     @resume.save
     
     respond_to do |format|
       format.html { }
        format.js  { render_to_facebox } 
       format.xml  { render :xml => @resume }
     end   
    end
  end 
  
  def public
      @resume = Resume.find_by_salt(params[:salt])  
     
     respond_to do |format|
       format.html { render :action => 'show',:layout=> 'resume'}
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
    @profile = Profile.new

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @resume }
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
    @resume = Resume.new(:user => current_user)
    @resume.build_summary(:content => '暂无',:specialties => '暂无')
    @resume.build_additionalinfo(:interests => '暂无')
    @profile = @resume.build_profile(params[:profile])
    respond_to do |format|
      if @profile.save && @resume.save
        flash[:notice] = '简历创建成功.'
        format.html { redirect_to edit_resume_path(@profile.resume) }
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
        format.html { redirect_to(@resume) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
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
