Rails.application.routes.draw do
  resources :reservations
  resources :itineraries
  resources :restaurants
  resources :destinations
  resources :user_destinations

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
