class Admin::CategoriesController < AdminController
  layout "admin"
  before_action :find_category, only: [:show]

  def index
    @categories = Category.recent
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "新增分類成功"
      redirect_to admin_categories_path
    else
      flash.now[:alert] = "請確認欄位資料"
      render :new
    end
  end

  def show
    @category_page = @category_items = @category.items.paginate(:page => params[:page])
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @category = Category.includes(items: [:photos, :specs]).find(params[:id])
  end
end