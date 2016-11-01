Rails.application.routes.draw do

  resources :itinerary_destinations
	root 'welcome#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users do 
  	resources :itineraries, only: [:new, :show, :edit, :update, :destroy]
  end
  
  get '/search', to: 'itineraries#index'

  resources :reservations
  resources :itineraries
  resources :restaurants
  resources :destinations


  

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
