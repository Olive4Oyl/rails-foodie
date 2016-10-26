class Reservation < ApplicationRecord
	belongs_to :itinerary
	belongs_to :restaurant
end
