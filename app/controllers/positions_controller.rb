class PositionsController < ApplicationController 
  before_filter :login_required
  before_filter :find_resume    

  # GET /positions
  # GET /positions.xml
  def index
    @positions = @resume.positions.all
    @section = 'resume'
    respond_to do |format|
      format.html { }
      format.xml  { render :xml => @positions }
    end
  end

  # GET /positions/1
  # GET /positions/1.xml
  def show 
    @section = 'resume'
    @position = Position.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @position }
    end
  end

  # GET /positions/new
  # GET /positions/new.xml
  def new
    @section = 'resume'
    @position = Position.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @position }
    end
  end

  # GET /positions/1/edit
  def edit
    @section = 'resume'
    @position = Position.find(params[:id])
    respond_to do |wants|
      wants.html {  } 
      wants.js { render :template => '/positions/edit',:layout => false }
    end
  end

  # POST /positions
  # POST /positions.xml
  def create
    @position = @resume.positions.build(params[:position])

    respond_to do |format|
      if @position.save
        flash[:notice] = '工作经验信息创建成功.'
        format.html { redirect_to edit_resume_path(@resume) }
        format.xml  { render :xml => @position, :status => :created, :location => @position }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @position.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /positions/1
  # PUT /positions/1.xml
  def update
    @position = Position.find(params[:id])

    respond_to do |format|
      if @position.update_attributes(params[:position])
        flash[:notice] = '工作经验信息更新成功.'
        format.html { redirect_to edit_resume_path(@resume) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @position.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /positions/1
  # DELETE /positions/1.xml
  def destroy
    @position = @resume.positions.find(params[:id])
    @position.destroy

    respond_to do |format|
      format.html { redirect_to(edit_resume_path(@resume)) }
      format.xml  { head :ok }
    end
  end 
  
end
