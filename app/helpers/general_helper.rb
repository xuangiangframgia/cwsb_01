module GeneralHelper
  def first_active images, image
    return "active" if images.first == image
  end

  def mark_to_maps addresses
    hash = Gmaps4rails.build_markers(addresses) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow address.venue.name
    end
    hash
  end

  def logged_in?
    unless user_signed_in?
      if request.xhr?
        render js: "window.location = '/users/sign_in'"
      else
        redirect_to new_user_session_path
      end
    end
  end
end
