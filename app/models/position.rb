class Position < ActiveRecord::Base
  belongs_to :resume
  validates_presence_of :title,:company,:start_at,:end_at
end
