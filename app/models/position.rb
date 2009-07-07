# == Schema Information
# Schema version: 20090707054722
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
  validates_presence_of :title,:company,:start_at,:end_at
end
