class InvitationsController < ApplicationController
  # GET /invitations
  # GET /invitations.xml   
  before_filter :login_required 
  layout 'application' 
  
  def index
    @invitations = Invitation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @invitations }
    end
  end

  # GET /invitations/1
  # GET /invitations/1.xml
  def show
    @invitation = Invitation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invitation }
    end
  end

  # GET /invitations/new
  # GET /invitations/new.xml
  def new 
    @user = current_user
    @invitation = @user.invitation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @invitation }
    end
  end

  # GET /invitations/1/edit
  def edit
    @invitation = Invitation.find(params[:id])
  end

  # POST /invitations
  # POST /invitations.xml
  def create 
    @user = current_user
    @invitation = @user.invitations.new(params[:invitation])

    respond_to do |format|
      if @invitation.save
        flash[:notice] = 'Invitation was successfully created.'
        format.html { redirect_to @user }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /invitations/1
  # PUT /invitations/1.xml
  def update
    @invitation = Invitation.find(params[:id])

    respond_to do |format|
      if @invitation.update_attributes(params[:invitation])
        flash[:notice] = 'Invitation was successfully updated.'
        format.html { redirect_to(@invitation) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @invitation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /invitations/1
  # DELETE /invitations/1.xml
  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy

    respond_to do |format|
      format.html { redirect_to(invitations_url) }
      format.xml  { head :ok }
    end
  end
end
