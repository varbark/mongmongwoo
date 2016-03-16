class Order < ActiveRecord::Base
  scope :recent, -> { order(id: :DESC) }

  acts_as_paranoid

  enum status: { order_placed: 0, paid: 1, shipping: 2, shipped: 3, order_cancelled: 4, good_returned: 5 }

  belongs_to :user
  has_many :items, class_name: "OrderItem", dependent: :destroy
  has_one :info, class_name: "OrderInfo", dependent: :destroy

  def info_store_code
    info.ship_store_code
  end

  def info_store_name(store_code)
    Store.find_by(store_code: store_code).name
  end

  def info_store_address(store_code)
    Store.find_by(store_code: store_code).address
  end
end