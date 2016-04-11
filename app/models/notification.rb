# == Schema Information
#
# Table name: notifications
#
#  id            :integer          not null, primary key
#  item_id       :integer
#  content_title :string(255)
#  content_text  :text(65535)
#  content_pic   :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Notification < ActiveRecord::Base
end