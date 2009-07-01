class Summary < ActiveRecord::Base 
    belongs_to :resume  
    validates_presence_of :content,:specialties
end
