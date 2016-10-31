class Itinerary < ApplicationRecord
	belongs_to :user
	has_many :itinerary_destinations
	has_many :destinations, through: :itinerary_destinations
	has_many :reservations
	has_many :restaurants, through: :reservations

	def destinations_attributes=(destination)
    	destination.values.each do |destination_attribute| 
    		destination = Destination.find_or_create_by(destination_attribute)
    			self.destinations << destination
    	end
    end

	# def self.search(term)
 #  		if term
 #    		where('name LIKE ?', "%#{term}%")
 #    		# binding.pry
 #    		@api = OpenTable::Client.new 
 #    		@api.restaurants(city: term)
 #    			# if @var.exists?
 #    			# 	@var.price
 #    			# 	binding.pry
 #    			# end
 #  		else
 #    		all
 #  		end
	# end

end
