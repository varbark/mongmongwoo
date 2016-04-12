class OrderItem < ActiveRecord::Base
  belongs_to :order

  def get_item_by_name
    Item.find_by(name: self.item_name)
  end
end