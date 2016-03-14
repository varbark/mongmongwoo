class Order < ActiveRecord::Base
  scope :recent, -> { order(id: :DESC) }

  acts_as_paranoid

  # enum status: { order_placed: 0, paid: 1, shipping: 2, shipped: 3, order_cancelled: 4, good_returned: 5 }

  belongs_to :user
  has_many :items, class_name: "OrderItem", dependent: :destroy
  has_one :info, class_name: "OrderInfo", dependent: :destroy
end