class Item < ActiveRecord::Base
  scope :recent, -> { order(id: :DESC) }

  enum status: { disable: 0, enable: 1 }

  mount_uploader :image, ImageUploader

  has_many :item_categories
  has_many :categories, through: :item_categories
end