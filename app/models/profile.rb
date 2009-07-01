class Profile < ActiveRecord::Base
  belongs_to :resume
  belongs_to :user
  
  validates_presence_of :name,:mobile,:email,:sex,:address,:birthday
  validates_length_of :name, :within => 3..20
end
