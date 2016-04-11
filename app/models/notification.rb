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
  scope :recent, lambda { order(id: :DESC) }

  belongs_to :item

  mount_uploader :content_pic, NotificationUploader

  def item_spec_pic_for_notification
    item = Item.find(self.item_id)
    first_spec = item.specs.first
    return first_spec
  end

  def send_content_pic
    specs.first.style_pic.url
  end
end