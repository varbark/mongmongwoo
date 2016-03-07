class Admin::CategoriesController < AdminController
  layout "admin"
  before_action :find_category, only: [:show]

  def index
    @categories = Category.recent

    # respond_to do |format|
    #   format.html
    #   format.json { render :json => @categories }
    # end
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
    respond_to do |format|
      format.html
      # format.json { render :json => @category }
      format.json { render :json => @category.items }
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @category = Category.find(params[:id])
  end
end