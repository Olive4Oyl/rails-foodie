class Restaurant < ApplicationRecord
	belongs_to :destination
	has_many :reservations
	has_many :itineraries, through: :reservations
end
