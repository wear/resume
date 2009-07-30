# == Schema Information
# Schema version: 20090729062155
#
# Table name: messages
#
#  id                :integer(4)      not null, primary key
#  sender_id         :integer(4)
#  recipient_id      :integer(4)
#  sender_deleted    :boolean(1)
#  recipient_deleted :boolean(1)
#  subject           :string(255)
#  body              :text
#  read_at           :datetime
#  created_at        :datetime
#  updated_at        :datetime
#  requestable_type  :string(255)
#  requestable_id    :integer(4)
#  req               :string(255)
#

class Message < ActiveRecord::Base
  is_private_message

  # The :to accessor is used by the scaffolding,
  # uncomment it if using it or you can remove it if not
  attr_accessor :to
  
end
