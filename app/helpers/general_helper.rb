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
end
