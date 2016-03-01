class Item < ActiveRecord::Base
  scope :recent, -> { order(id: :desc) }

  enum status: { disable: 0, enable: 1 }
end