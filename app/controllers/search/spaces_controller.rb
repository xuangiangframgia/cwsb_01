class Search::SpacesController < ApplicationController
  include GeneralHelper
  load_resource

  def index
    @addresses = Address.near params[:search], Settings.radius_search_in_miles
    @hash = mark_to_maps @addresses
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @booking = Booking.new space: @space, booking_from: Date.tomorrow,
      duration: Settings.default_duration, quantity: Settings.default_quantity
  end
end
