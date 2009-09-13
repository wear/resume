# == Schema Information
# Schema version: 20090729062155
#
# Table name: users
#
#  id                        :integer(4)      not null, primary key
#  login                     :string(40)
#  name                      :string(100)     default("")
#  email                     :string(100)
#  crypted_password          :string(40)
#  salt                      :string(40)
#  created_at                :datetime
#  updated_at                :datetime
#  remember_token            :string(40)
#  remember_token_expires_at :datetime
#  activation_code           :string(40)
#  activated_at              :datetime
#  invitation_code           :string(255)
#

require 'digest/sha1'

class User < ActiveRecord::Base
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken
  has_one :resume, :dependent => :destroy
  has_many :friendships, :class_name => "Friendship", :foreign_key => "user_id", :dependent => :destroy
  has_many :pending_friends, :class_name => "Friendship", :foreign_key => "friend_id",:conditions => ['status = ?','pending'], :dependent => :destroy 
  has_and_belongs_to_many :roles
  has_many :sent_recommendations,:class_name => 'Recommendation',:foreign_key => 'sender_id'
  has_many :received_recommendations,:class_name => 'Recommendation', :foreign_key => "receiver_id"  
  has_private_messages

  validates_presence_of     :login
  validates_length_of       :login,    :within => 2..40
  validates_uniqueness_of   :login
  validates_format_of       :login,    :with => Authentication.login_regex, :message => Authentication.bad_login_message

  validates_format_of       :name,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  validates_length_of       :name,     :maximum => 100

  validates_presence_of     :email
  validates_length_of       :email,    :within => 4..100 #r@a.wk
  validates_uniqueness_of   :email
  validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :name, :password, :password_confirmation 
  
  named_scope :weekly_joined,:conditions => ["created_at > ?", DateTime.now.to_time.at_beginning_of_week]
  
  before_create :make_initation_code
  before_create :make_activation_code   
  
  def offical_name
    (resume.nil? || resume.personalinfo.nil?) ? login : resume_name 
  end
  
  def admin?
    all_roles.include?("superuser")
  end
  
  def become_friend_with(friend)
      return false  if friend?(friend)
      r = friendships.new(:friend_id => friend.id)
      f = Friendship.new(:friend_id => self.id,:user_id => friend.id)
      f.save && r.save && f.accept! && r.accept!
  end
  
  def friend?(friend)
    friendships.find_by_friend_id_and_status(friend.id,'accepted')
  end
  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
   def self.authenticate(login, password)
     return nil if login.blank? || password.blank?
     u = find :first, :conditions => ['login = ? and activated_at IS NOT NULL', login] # need to get the salt
     u && u.authenticated?(password) ? u : nil
   end

  def login=(value)
    write_attribute :login, (value ? value.downcase : nil)
  end

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end 
  
  def self.generate_new_password(length=6)
    charactars = ("a".."z").to_a + ("A".."Z").to_a + ("1".."9").to_a
    (0..length).inject([]) { |password, i| password << charactars[rand(charactars.size-1)] }.join
  end 
  
  def resume_name
    resume.personalinfo.name
  end
  
  def active?
    # the existence of an activation code means they have not activated yet
    activation_code.nil?
  end
  
  # Activates the user in the database.
  def activate!
    @activated = true
    self.activated_at = Time.now.utc
    self.activation_code = nil
    save(false)
  end

  # Returns true if the user has just been activated.
  def recently_activated?
    @activated
  end           
  
  protected
  
  def make_activation_code
      self.activation_code = self.class.make_token
  end
   
  def make_initation_code
      self.invitation_code = self.class.generate_new_password(8)
  end
  
  def all_roles
    roles.map{|r| r.title}
  end

end
