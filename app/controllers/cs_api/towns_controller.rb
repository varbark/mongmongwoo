class CsApi::TownsController < CsApiController
  before_action :find_county, only: [:index]

  def index
    @towns = @county.towns

    respond_to do |format|
      format.json { render json: @towns }
    end
  end
end