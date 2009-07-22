# == Schema Information
# Schema version: 20090721142042
#
# Table name: recommendations
#
#  id            :integer(4)      not null, primary key
#  sender        :integer(4)
#  receiver      :integer(4)
#  sender_role   :string(255)
#  receiver_role :string(255)
#  description   :text
#  refer_type    :integer(4)
#  status        :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Recommendation < ActiveRecord::Base
  acts_as_state_machine :initial => :pending,:column => 'status' 
  
  
end
