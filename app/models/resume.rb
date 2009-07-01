class Resume < ActiveRecord::Base
  belongs_to :user  
  has_one :profile
  has_many :positions
  has_many :educations
  has_one :summary
  has_one :additionalinfo
end
