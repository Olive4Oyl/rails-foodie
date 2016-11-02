class Reservation < ApplicationRecord
	belongs_to :itinerary, optional: true
	belongs_to :restaurant, optional: true
	validates :reserved_time, numericality: { only_integer: true }
end
