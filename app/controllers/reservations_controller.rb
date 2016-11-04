class ReservationsController < ApplicationController
	require "open_table"
	include OpenTable
	before_action :set_reservation, only: [:edit, :update]
	before_action :set_user, only: [:edit, :update]

	def edit
		@reservation = Reservation.find_by(id: params[:id])
		@itinerary = Itinerary.find_by(id: params[:itinerary_id])
		@restaurants = Itinerary.search_by_destination(@itinerary.destinations.first)
	end

	def update
		if @reservation.update(res_params)
 			redirect_to user_itinerary_path(current_user, @reservation.itinerary), notice: 'Your Reservation was Created.'
 		else
 			render :template => 'itineraries/new'
 		end
	end

	private
	def res_params
		params.require(:reservation).permit(:itinerary_id, :restaurant_id)
	end

	def set_reservation
		@reservation = Reservation.find_by(id: params[:id])
	end

	def set_user
 		@user = User.find_by(id: params[:user_id])
 	end

end
