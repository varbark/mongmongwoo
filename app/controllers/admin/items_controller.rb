class Admin::ItemsController < AdminController
  layout "admin"
  before_action :find_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.recent
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      flash[:notice] = "新增商品成功"
      redirect_to root_path
    else
      flash.now[:alert] = "請確認欄位名稱"
      render :new
    end
  end

  def show
  end

  def edit    
  end

  def update
    if @item.update(item_params)
      flash[:notice] = "成功更新商品"
      redirect_to root_path
    else
      flash.now[:alert] = "請確認欄位名稱"
      render :edit
    end
  end

  def destroy
    @item.destroy
    flash[:warning] = "商品已刪除"
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :image, :slug)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end