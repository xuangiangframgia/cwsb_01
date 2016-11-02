class BookingHistoriesController < ApplicationController
  before_action :require_logged_in_user, only: :create
end
