class ItinerariesController < ApplicationController
 require "open_table"
 include OpenTable
 before_action :set_itinerary, only: [:show, :edit, :update, :destroy]

 def index
 end

 def new
 	@itinerary = Itinerary.new
 	@itinerary.destinations.build()
 end

 def create
 	@itinerary = Itinerary.new(itinerary_params)

 		respond_to do |format|
 			if @itinerary.save
 				format.html { redirect_to user_itinerary_path(current_user, @itinerary), notice: 'Your itinerary was created.'}
 			else
 				format.html { render :new }
 			end
 		end
 end

 def show
 	
 end

 def edit
 end

 def update
 	@itinerary.update(itinerary_params)
 end

 def destroy
 	@itinerary.destroy
 	redirect_to current_user_path
 end


 private
 def itinerary_params
 	binding.pry
 	params.require(:itinerary).permit(:user_id, :name, destinations_attributes: [:city])
 end

 def set_itinerary
 	@itinerary = Itinerary.find_by(id: params[:id])
 end

end
