# == Schema Information
# Schema version: 20090729062155
#
# Table name: resumes
#
#  id         :integer(4)      not null, primary key
#  status     :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer(4)
#  salt       :string(255)
#  usage      :string(255)
#  type       :integer(4)
#

class Resume < ActiveRecord::Base
  belongs_to :user     
  has_many :positions
  has_many :educations
  has_one :summary
  has_one :additionalinfo
  has_one :personalinfo   
  has_many :posters
  validates_length_of :usage, :within => 2..20,:allow_blank => true  
   
  
  cattr_reader :per_page
  @@per_page = 20
  
  def avatar_exists?
    return false unless personalinfo && personalinfo.assert
    File.file? "public/#{ personalinfo.assert.public_filename}"
  end         
  
  def owner?(owner)
    user == owner
  end
  
  def self.generate_salt(length=12)
    charactars = ("a".."z").to_a + ("A".."Z").to_a + ("1".."9").to_a
    (0..length).inject([]) { |password, i| password << charactars[rand(charactars.size-1)] }.join
  end   
  
  def public_url
    unless salt.nil?
      "#{APP_URL}/public/resume/#{self.salt}"
    else
      '还未发布'
    end
  end     
  
 def roles
   tmp_roles = []
   positions.each{|position| tmp_roles << ('在'+position.company+'做'+position.title) }
   educations.each{|edu| tmp_roles << ('在'+edu.name+'学'+edu.field) }
   tmp_roles
 end 
 

end
