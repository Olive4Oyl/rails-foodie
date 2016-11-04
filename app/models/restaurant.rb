class Restaurant < ApplicationRecord
	has_many :reservations
	has_many :itineraries, through: :reservations

end
