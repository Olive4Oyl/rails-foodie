class Itinerary < ApplicationRecord
	belongs_to :user
	has_many :reservations
	has_many :restaurants, through: :reservations


	def self.search(term)
  		if term
    		where('name LIKE ?', "%#{term}%")
    		# binding.pry
    		@api = OpenTable::Client.new 
    		@api.restaurants(city: term)
    			# if @var.exists?
    			# 	@var.price
    			# 	binding.pry
    			# end
  		else
    		all
  		end
	end

end
