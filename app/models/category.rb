class Category < ActiveRecord::Base
  scope :recent, -> { order(id: :DESC) }

  enum status: { disable: 0, enable: 1 }

  has_many :item_categories
  has_many :items, through: :item_categories
end