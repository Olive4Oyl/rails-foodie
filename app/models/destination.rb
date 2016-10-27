class Destination < ApplicationRecord
	has_many :user_destinations
	has_many :users, through: :user_destinations
	has_many :restaurants

	def self.search(term)

  		if term
    		where('name LIKE ?', "%#{term}%")
    		binding.pry
    		@api = OpenTable::Client.new 
    		@api.restaurants(city: term)
  		else
    		all

  		end
	end

end
