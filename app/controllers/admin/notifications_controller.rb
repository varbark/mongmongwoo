class Admin::NotificationsController < AdminController
  before_action :require_manager
  before_action :find_notification, only: [:show]

  def index
    @notification_page = @notifications = Notification.recent.paginate(page: params[:page])
  end

  def show
  end

  def new
    @notification = Notification.new
  end

  def create
    @notification = Notification.new(notification_params)

    if @notification.save!
      # Sending Notification
      gcm = GCM.new("AIzaSyAUjlCMS-ENLXfqGkSaOLDIZtz5BihP0kM")
      registration_ids = DeviceRegistration.all
      options = {
        data: {
          content_title: @notification.content_title,
          content_text: @notification.content_text,
          content_pic: @notification.content_pic.url,
          item_id: @notification.id
          },
        collapse_key: "updated_score"
      }
      response = gcm.send_notification(registration_ids, options)

      flash[:notice] = "成功推播訊息"
      redirect_to admin_notifications_path
    else
      flash.now[:alert] = "請確認訊息內容"
      render :new
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:item_id, :content_title, :content_text, :content_pic)
  end

  def find_notification
    @notification = Notification.find(params[:id])
  end
end