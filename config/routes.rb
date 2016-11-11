Rails.application.routes.draw do

  post "/hook" => "payments#update"

  resource :store_bookings, only: [:show, :update]

  resources :payments
  resources :booking_histories, only: :index
  resources :static_pages, only: :index

  namespace :search do
    resources :spaces
    root to: "spaces#index"
  end

  root "static_pages#index"
  devise_for :admins
  devise_for :users
  resources :bookings
  resources :venues do
    resources :user_role_venues
    resources :spaces do
      resources :prices
    end
    resources :orders
    resource :venue_detail
    resources :venue_amenities
    resources :amenities do
      resources :service_charges
    end
    resource :venue_market
  end

  resources :static_pages
    resources :notifications, only: [:index, :update] do
    post :read_noti_all, on: :collection
  end

  mount ActionCable.server => '/cable'
end
