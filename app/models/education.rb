# == Schema Information
# Schema version: 20090721142042
#
# Table name: educations
#
#  id          :integer(4)      not null, primary key
#  resume_id   :integer(4)
#  name        :string(255)
#  degree      :string(255)
#  field       :string(255)
#  start_at    :datetime
#  end_at      :datetime
#  description :text
#

class Education < ActiveRecord::Base 
  belongs_to :resume      
  validates_presence_of :name,:degree,:field,:start_at,:end_at
end
