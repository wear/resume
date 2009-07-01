class ResumesController < ApplicationController
  before_filter :login_required 
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

  # GET /resumes/1
  # GET /resumes/1.xml
  def show
    @resume = Resume.find(params[:id])  
    if current_user == @resume.user  

    respond_to do |format|
      format.html { render :layout => 'resume'}
      format.xml  { render :xml => @resume }
      format.pdf { render :layout => false}
    end   
  else                        
     flash[:error] = '您无权限查看此文件!' 
    respond_to do |wants|
      wants.html { redirect_to '/' }
      wants.pdf { redirect_to '/' }
    end 
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
    @resume = Resume.new(:user => current_user )
    @resume.build_summary(:content => '暂无',:specialties => '暂无')
    @resume.build_additionalinfo(:interests => '暂无')
    @profile = @resume.build_profile(params[:profile])
    respond_to do |format|
      if @profile.save && @resume.save
        flash[:notice] = 'Resume was successfully created.'
        format.html { redirect_to edit_resume_path(@profile.resume) }
      else
        format.html { render :action => "new" }
      end 
    end
  end

  # PUT /resumes/1
  # PUT /resumes/1.xml
  def update
    @resume = Resume.find(params[:id]) 
    if current_user == @resume.user  
    respond_to do |format|
      if @resume.update_attributes(params[:resume])
        flash[:notice] = 'Resume was successfully updated.'
        format.html { redirect_to(@resume) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @resume.errors, :status => :unprocessable_entity }
      end
    end 
     else                        
       flash[:error] = '您无权限查看此文件!' 
      respond_to do |wants|
        wants.html { redirect_to '/' }
        format.pdf { redirect_to '/' }
      end 
    end
  end

  # DELETE /resumes/1
  # DELETE /resumes/1.xml
  def destroy
    @resume = Resume.find(params[:id])   
    if current_user == @resume.user    
    
    @resume.destroy

    respond_to do |format|
      format.html { redirect_to(resumes_url) }
      format.xml  { head :ok }
    end
    else                        
      flash[:error] = '您无权限查看此文件!' 
     respond_to do |wants|
       wants.html { redirect_to '/' }
       format.pdf { redirect_to '/' }
     end
   end
  end
  
end
