# == Schema Information
# Schema version: 20090707054722
#
# Table name: resumes
#
#  id         :integer(4)      not null, primary key
#  status     :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer(4)
#  salt       :string(255)
#

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
    unless salt.nil?
      "http://#{APP_URL}/resumes/public/#{self.salt}"
    else
      '还未发布'
    end
  end     
  
  def roles
    roles = []
    positions.each{|position| roles << ('在' + position.company + '做' + position.title) }
    educations.each{|edu| roles << ('在' + edu.name + '都' + edu.field )} 
    roles
  end
  
  
end
