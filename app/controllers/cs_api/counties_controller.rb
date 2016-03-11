class CsApi::CountiesController < CsApiController  
  def index
    @counties = County.all

    respond_to do |format|
      format.json { render json: @counties }
    end
  end
end