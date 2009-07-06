class AdditionalinfosController < ApplicationController
  before_filter :login_required
  before_filter :find_resume
  # GET /additionalinfos
  # GET /additionalinfos.xml
  def index
    @additionalinfos = Additionalinfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @additionalinfos }
    end
  end

  # GET /additionalinfos/1
  # GET /additionalinfos/1.xml
  def show
    @additionalinfo = Additionalinfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @additionalinfo }
    end
  end

  # GET /additionalinfos/new
  # GET /additionalinfos/new.xml
  def new
    @additionalinfo = Additionalinfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @additionalinfo }
    end
  end

  # GET /additionalinfos/1/edit
  def edit
    @additionalinfo = @resume.additionalinfo
  end

  # POST /additionalinfos
  # POST /additionalinfos.xml
  def create
    @additionalinfo = Additionalinfo.new(params[:additionalinfo])

    respond_to do |format|
      if @additionalinfo.save
        flash[:notice] = '兴趣爱好创建成功.'
        format.html { redirect_to edit_resume_path(@resume) }
        format.xml  { render :xml => @additionalinfo, :status => :created, :location => @additionalinfo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @additionalinfo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /additionalinfos/1
  # PUT /additionalinfos/1.xml
  def update
    @additionalinfo = @resume.additionalinfo      

    respond_to do |format|
      if @additionalinfo.update_attributes(params[:additionalinfo])
        flash[:notice] = '兴趣爱好更新成功!.'
        format.html { redirect_to edit_resume_path(@resume) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @additionalinfo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /additionalinfos/1
  # DELETE /additionalinfos/1.xml
  def destroy
    @additionalinfo = @resume.additionalinfo      
    @additionalinfo.destroy

    respond_to do |format|
      format.html { redirect_to(resumes_url) }
      format.xml  { head :ok }
    end
  end
end
