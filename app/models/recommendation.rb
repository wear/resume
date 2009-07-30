# == Schema Information
# Schema version: 20090729062155
#
# Table name: recommendations
#
#  id                 :integer(4)      not null, primary key
#  sender_id          :integer(4)
#  receiver_id        :integer(4)
#  visible            :boolean(1)
#  recommendable_type :string(255)
#  recommandable_id   :integer(4)
#  desc               :text
#  sender_role        :string(255)
#  refer_type         :integer(4)
#  created_at         :datetime
#  updated_at         :datetime
#

class Recommendation < ActiveRecord::Base
  belongs_to :recommendation, :polymorphic => true
  
end
