class Education < ActiveRecord::Base 
  belongs_to :resume      
  validates_presence_of :name,:degree,:field,:start_at,:end_at
end
