# == Schema Information
# Schema version: 20090721142042
#
# Table name: friendships
#
#  id         :integer(4)      not null, primary key
#  friend_id  :integer(4)
#  user_id    :integer(4)
#  status     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User", :foreign_key => "friend_id" 
  
  acts_as_state_machine :initial => :pending,:column => 'status'
  

  validates_presence_of   :user
  validates_presence_of   :friend
  validates_uniqueness_of :friend_id, :scope => :user_id
  
  state :pending
  state :accepted
  
  event :accept do
    transitions :to => :accepted, :from => :pending
  end
  
end
