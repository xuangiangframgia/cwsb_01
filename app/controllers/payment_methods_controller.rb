class PaymentMethodsController < ApplicationController
  before_action :load_venue

  def index
    @payment_methods = @venue.payment_methods
  end

  def new
    @payment_method = @venue.payment_methods.new
  end

  def create
    @payment_method = @venue.payment_methods.new payment_method_params
    if @payment_method.save
      flash[:success] = t ".create_success"
      redirect_to edit_venue_venue_market_path
    else
      flash[:danger] = t ".create_fail"
      redirect_to edit_venue_venue_market_path
    end
  end

  def edit
  end

  def update
    if @venue.payment_method.update_attributes payment_method_params
      flash[:success] = t ".updated"
      redirect_to edit_venue_venue_market_path
    else
      flash[:danger] = t ".update_fail"
      render :edit
    end
  end

  def destroy
  end

  private
  def payment_method_params
    params.require(:payment_method).permit :venue_id, :name, :email
  end

  def load_venue
    @venue = Venue.find_by id: params[:venue_id]
    if @venue.nil?
      flash[:danger] = t "venue.not_found"
      redirect_to venues_path
    end
  end
end
