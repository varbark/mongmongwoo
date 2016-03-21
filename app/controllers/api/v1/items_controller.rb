class Api::V1::ItemsController < ApiController
  def index
    items = Item.includes(:photos, :item_categories, :categories).all
    render json: items, only: [:id, :name, :price]
  end

  def show
    item = Item.find(params[:id])
    result_item = {}
    result_item[:id] = item.id
    result_item[:name] = item.name
    result_item[:price] = item.price
    result_item[:description] = item.description
    include_photos = []    
    item.photos.each do |photo|
      pic = {}
      pic[:image_url] = photo.image.medium.url
      pic[:photo_intro] = photo.photo_intro
      include_photos << pic
    end
    result_item[:photos] = include_photos
    render json: result_item
  end
end