Rails.application.routes.draw do
  namespace :search do
    resources :spaces
    root to: "spaces#index"
  end

  root "venues#index"
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :venues
end
