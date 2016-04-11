class Api::V1::DeviceRegistrationsController < ApiController
  def create
    begin
      unless DeviceRegistration.find_by(registration_id: params[:registration_id]).present?
        DeviceRegistration.create!(
          registration_id: params[:registration_id]
        )
      end
      render json: "Success：新增裝置完成"
    rescue Exception => e
      render json: "Error"
    end
  end
end