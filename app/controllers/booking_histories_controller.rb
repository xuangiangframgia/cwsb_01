class BookingHistoriesController < ApplicationController
  before_action :require_logged_in_user, only: :create

  def index
    current_bookings = current_user.bookings.have_order
    @pendings = current_bookings
      .group_by_venue Booking.states.keys[Settings.requested]
    @accepts = current_bookings
      .group_by_venue Booking.states.keys[Settings.accepted]
    @rejects = current_bookings
      .group_by_venue Booking.states.keys[Settings.rejected]
  end
end
