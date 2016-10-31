class Restaurant < ApplicationRecord
	has_many :reservations
	has_many :itineraries, through: :reservations

	# api = OpenTable::Client.new

	# # Find restaurants
	# resp = api.restaurants(:city => "Chicago")
	
	# # Process response
	# resp['count']       # => records found
	# resp['restaurants'] # => restaurant records

	# # Fetch a single record
	# api.restaurant(81169)

end
