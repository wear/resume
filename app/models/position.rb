# == Schema Information
# Schema version: 20090802025238
#
# Table name: positions
#
#  id          :integer(4)      not null, primary key
#  resume_id   :integer(4)
#  title       :string(255)
#  company     :string(255)
#  start_at    :datetime
#  end_at      :datetime
#  description :text
#

class Position < ActiveRecord::Base
  belongs_to :resume
  validates_presence_of :title,:company,:start_at
  has_many :recommends, :as => :recommendable 
  validates_length_of :description, :minimum => 6
  validates_presence_of :start_at
  
  def validate 
    unless start_at.nil? || end_at.nil?
      if start_at > end_at
        errors.add_to_base("开始时间不能大于结束时间.")       
      end
    end  
  end
end
