# == Schema Information
# Schema version: 20090729062155
#
# Table name: posters
#
#  id         :integer(4)      not null, primary key
#  position   :string(255)
#  email      :string(255)
#  content    :text
#  resume_id  :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class Poster < ActiveRecord::Base 
  belongs_to :resume  
  validates_length_of :position, :minimum => 2
  validates_length_of :content, :minimum => 18
  validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :email
  validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message
end
