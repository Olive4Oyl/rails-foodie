class ReservationsController < ApplicationController
	require "open_table"
	include OpenTable
	before_action :set_reservation, only: [:edit, :update]
	before_action :set_user, only: [:edit, :update]

	def edit
		binding.pry
	end

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

	def set_reservation
		@reservation = Reservation.find_by(id: params[:id])
	end

	def set_user
 		@user = User.find_by(id: params[:user_id])
 	end

end
