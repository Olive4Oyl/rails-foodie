class User < ApplicationRecord
	has_many :user_destinations
	has_many :destinations, through: :user_destinations
	has_many :itineraries

end
