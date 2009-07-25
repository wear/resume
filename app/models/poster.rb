class Poster < ActiveRecord::Base 
  belongs_to :resume  
  validates_length_of :position, :minimum => 2
  validates_length_of :content, :minimum => 18
  validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :email
  validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message
end
