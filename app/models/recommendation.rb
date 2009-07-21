class Recommendation < ActiveRecord::Base
  acts_as_state_machine :initial => :pending 
  
  
end
