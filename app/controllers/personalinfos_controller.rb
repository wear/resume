class PersonalinfosController < ApplicationController  
  before_filter :login_required   
  before_filter :find_resume
  # GET /personalinfos/1
  # GET /personalinfos/1.xml
  def show
    @personalinfo = personalinfos.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @personalinfo }
    end
  end

  # GET /personalinfos/new
  # GET /personalinfos/new.xml
  def new     
      @section = 'resume'
      @user = current_user                      
      @personalinfo = @resume.build_personalinfo
      respond_to do |wants|
        wants.html {   }
      end
  end

  # GET /personalinfos/1/edit
  def edit  
    @personalinfo = @resume.personalinfo
  end

  # POST /personalinfos
  # POST /personalinfos.xml
  def create 
    @section = 'resume'
    @personalinfo = @resume.build_personalinfo(params[:personalinfo])
    
 #   @resume = current_user.resumes.new(:usage => '暂无')
 #   @resume.build_summary(:content => '暂无',:specialties => '暂无')
 #   @resume.build_additionalinfo(:interests => '暂无') 
 #   @resume.salt = Resume.generate_salt
    
    respond_to do |format|
      if @personalinfo.save
        flash[:notice] = '简历创建成功,请添加工作/教育等基本信息以完善你的简历！'
        format.html { redirect_to(edit_resume_path(@resume)) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @personalinfo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /personalinfos/1
  # PUT /personalinfos/1.xml
  def update 
    @personalinfo = @resume.personalinfo

    respond_to do |format|
      if @personalinfo.update_attributes(params[:personalinfo])
        flash[:notice] = '个人资料更新成功!.'
        format.html { redirect_to resumes_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @personalinfo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /personalinfos/1
  # DELETE /personalinfos/1.xml
  def destroy
    @personalinfo = @user.personalinfo.find(params[:id])
    @personalinfo.destroy

    respond_to do |format|
      format.html { redirect_to(personalinfos_url) }
      format.xml  { head :ok }
    end
  end
  
  
  protected
  
  def find_user
    @resume = current_user.resume.find(params[:id])
  end 
end
