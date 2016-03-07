module Admin::ItemsHelper
  def item_title
    action_name == "new" ? "新增商品" : "編輯商品"
  end
end