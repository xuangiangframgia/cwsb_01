class BookingsController < ApplicationController
  before_action :authenticate_user!
  load_resource

  def index
  end

  def new
  end

  def create
    @booking = Booking.new booking_params
    @booking.save
  end

  private
  def booking_params
    params.require(:booking).permit(:space_id, :booking_from, :duration,
      :booking_type_id, :quantity).merge! user: current_user
  end
end
