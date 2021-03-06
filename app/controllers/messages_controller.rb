class MessagesController < ApplicationController 
  before_filter :set_user
#  before_filter :require_current_user
  
  def index
    @section = 'message'
    respond_to do |wants|
        @messages = @user.received_messages
        wants.html {  }
    end
  end
  
  def sent_box
    @section = 'message'    
    respond_to do |wants|
        @messages = @user.sent_messages
        wants.html {  }
    end
  end
  
  def show 
    @section = 'message'
    @message = Message.read(params[:id], current_user)
  end
  
  def new 
    @message = Message.new
    if !params[:req].nil? && !params[:receiver].nil?
        @receiver = User.find(params[:receiver])
        @message.to = @receiver.login
        @message.subject = "好友申请"
        @message.body = "我对你的资料非常感兴趣,请加我详谈!"
        @message.req_type = 'request_friend'
        @message.req_id =  @user.id
    end
    
    if params[:reply_to]
      @reply_to = @user.received_messages.find(params[:reply_to])
      unless @reply_to.nil?
        @message.to = @reply_to.sender.login
        @message.subject = "回复: #{@reply_to.subject}"
        @message.body = "\n\n*原始信息*\n\n #{@reply_to.body}"
      end
    end
  end
  
  def create
    @message = Message.new(params[:message])
    @message.sender = @user
    @message.recipient = User.find_by_login(params[:message][:to])

    if @message.save
      flash[:notice] = "Message sent"
      redirect_to user_messages_path(@user)
    else
      render :action => :new
    end
  end
  
  def delete_selected
    if request.post?
      if params[:delete]
        params[:delete].each { |id|
          @message = Message.find(:first, :conditions => ["messages.id = ? AND (sender_id = ? OR recipient_id = ?)", id, @user, @user])
          @message.mark_deleted(@user) unless @message.nil?
        }
        flash[:notice] = "Messages deleted"
      end
      redirect_to user_messages_path(@user, @messages)
    end
  end
  
  private
    def set_user
      @user = User.find(params[:user_id])
    end
end