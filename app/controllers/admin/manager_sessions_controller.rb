class ManagerSessionsController < AdminController
  def new
    redirect_to admin_root_path if current_manager
  end

  def create
    manager = Manager.find_by(email: params[:email])

    if manager && manager.authenticate(params[:password])
      session[:manager_id] = manager.id
      flash[:notice] = "Welcome, #{manager.username}!"
      redirect_to admin_root_path
    else
      flash.now[:alert] = "請確認登入資訊!"
      render :new
    end
  end

  def destroy
    session[:manager_id] = nil
    flash[:warning] = "你已經登出了!"
    redirect_to root_path
  end
end