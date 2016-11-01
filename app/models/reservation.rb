class Reservation < ApplicationRecord
	belongs_to :itinerary, optional: true
	belongs_to :restaurant, optional: true
end
