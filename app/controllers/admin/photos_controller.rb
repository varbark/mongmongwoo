class Admin::PhotosController < AdminController
  before_action :find_item

  def index
    @photos = @item.photos
  end

  def new
    @photo = @item.photos.new
  end

  def create
    # 多張圖片上傳
    begin
      create_photo_params[:images].each do |image|
        @item.photos.create!(image: image)
      end
      flash[:notice] = "圖片上傳完成"
      redirect_to admin_item_photos_path(@item)
    rescue => e
      flash.now[:alert] = "請確認上傳圖片是否正確"
    end

    # 單張圖片上傳
    # @photo = @item.photos.new(photo_params)

    # if @photo.save!
    #   flash[:notice] = "新增圖片成功"
    #   redirect_to admin_item_photos_path(@item)
    # else
    #   flash.now[:alert] = "請確認上傳圖片是否正確"
    #   render :edit
    # end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def create_photo_params
    params.require(:photo).permit(:image, :photo_intro).merge!(images: params[:images])
  end
end