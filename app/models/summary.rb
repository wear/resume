# == Schema Information
# Schema version: 20090729062155
#
# Table name: summaries
#
#  id          :integer(4)      not null, primary key
#  resume_id   :integer(4)
#  content     :text
#  specialties :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Summary < ActiveRecord::Base 
    belongs_to :resume  
    validates_presence_of :content,:specialties
    validates_length_of :content, :within => 2..20
    acts_as_taggable
    
end
