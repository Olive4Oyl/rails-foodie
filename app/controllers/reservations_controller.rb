class ReservationsController < ApplicationController
	require "open_table"
	include OpenTable

	def update
		@reservation = Reservation.new(res_params)
		if @reservation.valid?
 			@reservation.save
 			redirect_to user_itinerary_path(current_user, @reservation.itinerary), notice: 'Your Reservation was Created.'
 		else
 			render :template => 'itinerariese/new'
 		end
	end

	private
	def res_params
		params.require(:reservation).permit(:itinerary_id, :restaurant_id, :reserved_time)
	end

end
