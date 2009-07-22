# == Schema Information
# Schema version: 20090721142042
#
# Table name: profiles
#
#  id             :integer(4)      not null, primary key
#  resume_id      :integer(4)
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
#  user_id        :integer(4)
#

class Profile < ActiveRecord::Base
  belongs_to :resume
  belongs_to :user
  has_one :assert, :as => 'attachable'
  
  validates_presence_of :name,:mobile,:email,:sex,:address,:birthday
  validates_length_of :name, :within => 2..20
  validates_numericality_of :mobile
  validates_format_of :mobile, :with => /^13[0-9]|^15[0-9][0-9]{8}$/
  validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :email
  validates_format_of       :email,    :with => Authentication.email_regex, :message => '必须符合email的格式'  
  
  def avatar_exists?
    return false unless assert
    File.file? "public/#{assert.public_filename}"
  end    
 
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
  
end
