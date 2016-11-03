class SpacesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_venue, only: [:new, :index, :create]
  before_action :load_booking_types, only: [:new, :create]
  load_resource

  def index
    @spaces = @venue.spaces
  end

  def new
    @space = Space.new
    build_resource
  end

  def create
    @space = Space.new space_params
    if @space.save
      flash[:success] = t "space.create_success"
      redirect_to venue_spaces_path
    else
      flash[:danger] = t "space.create_fail"
      build_resource
      render :new
    end
  end

  def destroy
    @space.destroy
    respond_to do |format|
      format.js
    end
  end

  private
  def load_venue
    @venue = Venue.find_by id: params[:venue_id]
    if @venue.nil?
      flash[:danger] = t "venue.not_found"
      redirect_to venues_path
    end
  end

  def space_params
    params.require(:space).permit :space_type, :size, :capicity, :quantity,
      :description, :venue_id, images_attributes: [:id, :picture],
      prices_attributes: [:id, :price, :booking_type_id, :_destroy]
  end

  def build_resource
    @space.images.build if @space.images.blank?
    @space.prices.build
  end

  def load_booking_types
    @booking_types = BookingType.all
  end
end
