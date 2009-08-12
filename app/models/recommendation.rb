# == Schema Information
# Schema version: 20090802025238
#
# Table name: recommendations
#
#  id            :integer(4)      not null, primary key
#  sender_id     :integer(4)
#  receiver_id   :integer(4)
#  visible       :boolean(1)
#  desc          :text
#  sender_role   :string(255)
#  receiver_role :string(255)
#  refer_type    :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Recommendation < ActiveRecord::Base
  validates_length_of :desc, :minimum => 10
  validates_presence_of :sender_role
  validates_presence_of :receiver_role
  validates_presence_of :refer_type   
  
  belongs_to :sender, :class_name => "User" 
  belongs_to :receiver, :class_name => "User" 
  
  named_scope :visible, :conditions => ['visible = ?',true]           
  
end
