class SummariesController < ApplicationController
  before_filter :login_required  
  before_filter :find_resume 
      
  # GET /summaries
  # GET /summaries.xml
  def index
    @summaries = Summary.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @summaries }
    end
  end

  # GET /summaries/1
  # GET /summaries/1.xml
  def show
    @summary = Summary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @summary }
    end
  end

  # GET /summaries/new
  # GET /summaries/new.xml
  def new
    @summary = Summary.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @summary }
    end
  end

  # GET /summaries/1/edit
  def edit
    @section = 'resume'
    @summary = @resume.summary
  end

  # POST /summaries
  # POST /summaries.xml
  def create
    @summary = Summary.new(params[:summary])

    respond_to do |format|
      if @summary.save
        flash[:notice] = '个人总结创建成功.'
        format.html { redirect_to edit_resume_path(@resume) }
        format.xml  { render :xml => @summary, :status => :created, :location => @summary }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @summary.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /summaries/1
  # PUT /summaries/1.xml
  def update
   @summary = @resume.summary

    respond_to do |format|
      if @summary.update_attributes(params[:summary])
        flash[:notice] = '个人总结编辑成功.'
        format.html { redirect_to edit_resume_path(@resume) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @summary.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /summaries/1
  # DELETE /summaries/1.xml
  def destroy
    @summary = Summary.find(params[:id])
    @summary.destroy

    respond_to do |format|
      format.html { redirect_to(summaries_url) }
      format.xml  { head :ok }
    end
  end
end
