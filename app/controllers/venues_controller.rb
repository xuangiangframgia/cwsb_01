class VenuesController < ApplicationController
  before_action :authenticate_user!
  load_resource

  def index
    @venues = current_user.venues
  end

  def new
    @venue = Venue.new
    @venue.build_address
  end

  def create
    @venue = Venue.new venue_params
    if @venue.save
      flash[:success] = t "flash.success_message"
      redirect_to edit_venue_path @venue
    else
      flash[:danger] = t "flash.danger_message"
      @venue.build_address
      render :new
    end
  end

  def update
    if @venue.update_attributes venue_params
      flash[:success] = t "flash.success_message"
      redirect_to edit_venue_path @venue, active: params[:detail]
    else
      flash[:danger] = t "flash.danger_message"
      @venue.build_address
      render :edit
    end
  end

  def edit
    @venue.images.build if @venue.images.blank?
  end

  private
  def venue_params
    params.require(:venue).permit(:name, :description, :phone_number, :email,
      :website, :number_of_floors, :floor_space, :number_of_rooms, :number_of_desks,
      address_attributes: [:details, :city, :postal_code, :street_address, :unit, :id],
      images_attributes: [:picture], working_times_attributes: [:id,
        :day_in_week, :working_to, :working_from, :status]).merge! user: current_user
  end
end
