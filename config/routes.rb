Rails.application.routes.draw do
  devise_for :users
  resources :reservations
  resources :itineraries
  resources :restaurants
  resources :destinations
  resources :user_destinations


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
