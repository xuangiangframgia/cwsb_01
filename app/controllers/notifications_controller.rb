class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def update
    @notification = Notification.find_by id: params[:id]
    @notification.update_attributes status: true
  end

  def read_noti_all
    Notification.by_receiver(current_user.id).unread.update_all status: true
    respond_to do |format|
      format.html {redirect_to notifications_path}
      format.js
    end
  end
end
