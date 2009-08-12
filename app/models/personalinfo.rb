# == Schema Information
# Schema version: 20090802025238
#
# Table name: personalinfos
#
#  id             :integer(4)      not null, primary key
#  name           :string(255)
#  mobile         :string(255)
#  address        :string(255)
#  email          :string(255)
#  birthday       :datetime
#  marital_status :boolean(1)
#  sex            :string(255)
#  hometwon       :string(255)
#  hukou          :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  resume_id      :integer(4)
#

class Personalinfo < ActiveRecord::Base
  belongs_to :resume
  has_one :assert, :as => 'attachable'
  
  validates_presence_of :name,:mobile,:email,:sex,:address,:birthday
  validates_length_of :name, :within => 2..20
  validates_numericality_of :mobile
  validates_format_of :mobile, :with => /^13[0-9]|^15[0-9][0-9]{8}$/
  validates_length_of       :email,    :within => 6..100 #r@a.wk   
  validates_format_of       :email,    :with => Authentication.email_regex, :message => '必须符合email的格式'      
 
  def avatar_data=(data) 
    return if data.blank?
    if assert
      assert.update_attributes :uploaded_data => data
    else
      self.assert = Assert.create :uploaded_data => data
    end
  end  
  
  def validate
    unless self.mobile.to_s.size == 11
      errors.add("mobile", "必须为11位")
    end
  end
  
  def create_initial_resume
      resume = Resume.new(:user => user)
      resume.build_summary(:content => '暂无',:specialties => '暂无')
      resume.build_additionalinfo(:interests => '暂无')
      resume.build_additionalinfo(:interests => '暂无') 
      resume.salt = Resume.generate_salt
      resume.save
  end
  
end
