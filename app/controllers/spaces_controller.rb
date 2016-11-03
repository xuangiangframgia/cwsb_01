class SpacesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_venue, only: [:new, :index]
  load_resource

  def index
    @spaces = @venue.spaces
  end

  def new
    @space = Space.new
  end

  def create
    @space = Space.new space_params
    if @space.save
      flash.now[:success] = t "space.create_success"
      redirect_to venue_spaces_path
    else
      flash.now[:danger] = t "space.create_fail"
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
      :description, :venue_id
  end
end
