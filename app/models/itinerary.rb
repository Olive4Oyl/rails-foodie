class Itinerary < ApplicationRecord
	belongs_to :user
	has_many :reservations
	has_many :restaurants, through: :reservations
end
