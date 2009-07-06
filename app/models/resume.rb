class Resume < ActiveRecord::Base
  belongs_to :user  
  has_one :profile
  has_many :positions
  has_many :educations
  has_one :summary
  has_one :additionalinfo
  
  cattr_reader :per_page
  @@per_page = 20
  
  def self.generate_salt(length=12)
    charactars = ("a".."z").to_a + ("A".."Z").to_a + ("1".."9").to_a
    (0..length).inject([]) { |password, i| password << charactars[rand(charactars.size-1)] }.join
  end   
  
  def public_url
    "http://#{APP_URL}/resumes/public/#{self.salt}"
  end
  
  
end
