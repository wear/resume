# == Schema Information
# Schema version: 20090707054722
#
# Table name: additionalinfos
#
#  id         :integer(4)      not null, primary key
#  resume_id  :integer(4)
#  interests  :text
#  groups     :text
#  awards     :text
#  created_at :datetime
#  updated_at :datetime
#

class Additionalinfo < ActiveRecord::Base
    validates_length_of :interests, :within => 3..20
    belongs_to :resume  
end
