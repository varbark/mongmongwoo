class CsApi::RoadsController < CsApiController
  before_action :find_county, only: [:index]
  before_action :find_town, only: [:index]

  def index
    @roads = @town.roads

    render json: @roads, only: [:id, :name]

    # respond_to do |format|
    #   format.json { render json: @roads }
    # end
  end
end