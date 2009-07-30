class ProfilesController < ApplicationController  
  before_filter :login_required   
  before_filter :find_user
  # GET /profiles/1
  # GET /profiles/1.xml
  def show
    @profile = Profile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profile }
    end
  end

  # GET /profiles/new
  # GET /profiles/new.xml
  def new
    @profile = @user.build_profile

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @profile }
    end
  end

  # GET /profiles/1/edit
  def edit  
    @profile = @user.profile
  end

  # POST /profiles
  # POST /profiles.xml
  def create
    @profile = @user.build_profile(params[:profile])
    
    @resume = current_user.resumes.new(:usage => '暂无')
    @resume.build_summary(:content => '暂无',:specialties => '暂无')
    @resume.build_additionalinfo(:interests => '暂无') 
    @resume.salt = Resume.generate_salt
    
    respond_to do |format|
      if @profile.save &&  @resume.save
        flash[:notice] = '个人资料创建成功!'
        format.html { redirect_to(edit_resume_path(@resume)) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profiles/1
  # PUT /profiles/1.xml
  def update 
    @profile = @user.profile

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        flash[:notice] = '个人资料更新成功!.'
        format.html { redirect_to resumes_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.xml
  def destroy
    @profile = @user.profile.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to(profiles_url) }
      format.xml  { head :ok }
    end
  end
  
  
  protected
  
  def find_user
    @user = current_user
  end 
end
