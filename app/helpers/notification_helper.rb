module NotificationHelper
  def load_link status_message
    if status_message == t("notification.status_message")
      store_bookings_path
    else
      booking_histories_path
    end
  end
end
