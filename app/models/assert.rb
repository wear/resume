# == Schema Information
# Schema version: 20090920043026
#
# Table name: asserts
#
#  id              :integer(4)      not null, primary key
#  filename        :string(255)
#  width           :integer(4)
#  height          :integer(4)
#  content_type    :string(255)
#  size            :integer(4)
#  attachable_type :string(255)
#  attachable_id   :integer(4)
#  updated_at      :datetime
#  created_at      :datetime
#  thumbnail       :string(255)
#  parent_id       :integer(4)
#

class Assert < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true 
  
  validates_presence_of :filename
  
  has_attachment(
    :storage => :file_system,
    :resize_to => [77,99],
    :content_type => :image
  ) 

  validates_as_attachment

end
