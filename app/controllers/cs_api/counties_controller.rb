class CsApi::CountiesController < CsApiController  
  def index
    @counties = County.all

    render json: @counties

    # respond_to do |format|
    #   format.json { render json: @counties }
    # end
  end
end