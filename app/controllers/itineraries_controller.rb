class ItinerariesController < ApplicationController
 require "open_table"
 include OpenTable

 def new
 	@itinerary = Itinerary.new
 	@itinerary = Itinerary.search(params[:city])
 	@itinerary.restaurants.destinations_build
 end

 def create
 	@itinerary = Itinerary.create(itinerary_params)
 	redirect_to @itinerary
 end


 private
 def itinerary_params
 	params.require(:itinerary).permit(:name, destination_attributes: [:city])
 end

end
