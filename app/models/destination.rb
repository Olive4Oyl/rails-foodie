class Destination < ApplicationRecord
	has_many :itinerary_destinations
	has_many :destinations, through: :itinerary_destinations


end
