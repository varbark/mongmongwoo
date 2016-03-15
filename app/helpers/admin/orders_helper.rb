module Admin::OrdersHelper
  def paid_status(order)
    (order.is_paid) == true ? "完成付款" : "尚未付款"
  end

  def order_status(order_info)
    case order_info
    when "order_placed"
      return "新增訂單"
    when "paid"
      return "已付款"
    when "shipping"
      return "出貨中"
    when "shipped"
      return "已到貨"
    when "order_cancelled"
      return "訂單取消"
    when "good_returned"
      return "退貨"
    end
  end
end