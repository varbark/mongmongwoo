class Api::V1::CountiesController < ApiController
  def index
    @counties = County.all

    render json: @counties
  end
end