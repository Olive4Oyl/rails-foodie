class ItinerariesController < ApplicationController
 require "open_table"
 include OpenTable
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_itinerary, only: [:show, :edit, :update, :destroy]

 def index
 end

 def new
 	@itinerary = Itinerary.new
 	@itinerary.destinations.build()
 end

 def create
 	@itinerary = Itinerary.new(itinerary_params)
 	if @itinerary.valid?
 		@itinerary.save
 		redirect_to user_itinerary_path(current_user, @itinerary), notice: 'Your Itinerary was Created.'
 	else
 		render :new 
 	end
 end

 def show
 end

 def edit

 end

 def update
 	if @itinerary.update(itinerary_params)
 		binding.pry 
 		# res = Reservation.create(itinerary_id: params[:id], restaurant_id: )
 		redirect_to user_itinerary_path(current_user, @itinerary), notice: 'Your Itinerary Has Been Updated.'
 	else
 		render :edit
 	end
 end

 def destroy
 	@itinerary.delete
 	redirect_to @user
 end


 private
 def itinerary_params
 	params.require(:itinerary).permit(:id, :user_id, :name, destinations_attributes: [:city], :reservation =>[:restaurant])
 end

 def set_itinerary
 	@itinerary = Itinerary.find_by(id: params[:id])
 end

 def set_user
 	@user = User.find_by(id: params[:user_id])
 end

end
