class EducationsController < ApplicationController
  # GET /educations
  # GET /educations.xml       
  before_filter :login_required             
  before_filter :find_resume 
  def index
    @educations = Education.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @educations }
    end
  end

  # GET /educations/1
  # GET /educations/1.xml
  def show
    @education = Education.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @education }
    end
  end

  # GET /educations/new
  # GET /educations/new.xml
  def new
    @education = Education.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @education }
    end
  end

  # GET /educations/1/edit
  def edit
    @education = Education.find(params[:id])
  end

  # POST /educations
  # POST /educations.xml
  def create
    @education = @resume.educations.build(params[:education])

    respond_to do |format|
      if @education.save 
        flash[:notice] = '教育信息创建成功.'
        format.html { redirect_to edit_resume_path(@resume) }
        format.xml  { render :xml => @resume, :status => :created, :location => @resume }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @education.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /educations/1
  # PUT /educations/1.xml
  def update
    @education = Education.find(params[:id])

    respond_to do |format|
      if @education.update_attributes(params[:education])
        flash[:notice] = '教育信息更新成功.'
        format.html { redirect_to edit_resume_path(@resume) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @education.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /educations/1
  # DELETE /educations/1.xml
  def destroy
    @education = @resume.educations.find(params[:id])
    @education.destroy

    respond_to do |format|
      format.html { redirect_to(edit_resume_path(@resume)) }
      format.xml  { head :ok }
    end
  end        
  
end
