class Admin::UsersController < AdminController
  layout "admin"

  # 針對import_usere關掉表單token驗證
  skip_before_action :verify_authenticity_token, only: [:import_user]

  def index
    @users = User.recent
  end

  def show  
  end

  #TODO
  def import_user
    begin
      user = User.new

      user.user_name = params[:user_name]
      user.real_name = params[:real_name]
      user.gender = params[:gender]
      user.phone = params[:phone]
      user.address = params[:address]
      user.uid = params[:uid]

      user.save!

      render plain: "success"
    rescue
    end
  end
end