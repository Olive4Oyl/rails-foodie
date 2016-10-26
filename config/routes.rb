Rails.application.routes.draw do
  resources :reservations
  resources :itineraries
  resources :restaurants
  resources :destinations
  resources :user_destinations
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
