class Admin::OrdersController < AdminController
  def index
    @orders = Order.recent

    respond_to do |format|
      format.html
      format.json { render json: @orders, only: [:id, :user_id, :uid, :total, :is_paid, :status, :payment_method, :ship_fee, :items_price] }
    end
  end

  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @order }
    end
  end
end