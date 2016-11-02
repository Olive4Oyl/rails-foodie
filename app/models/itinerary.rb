class Itinerary < ApplicationRecord
	belongs_to :user
	has_many :itinerary_destinations
	has_many :destinations, through: :itinerary_destinations
	has_many :reservations
	has_many :restaurants, through: :reservations
	accepts_nested_attributes_for :reservations
	validates :name, presence: true, :uniqueness => true

	scope :recent, -> { order("itineraries.updated_at DESC") }


	def destinations_attributes=(attributes)
    	attributes.values.each do |destination_attribute| 
    		destination = Destination.find_or_create_by(destination_attribute)
    		self.destinations << destination
    	end
    end

    def self.search_by_destination(dest)
		api = OpenTable::Client.new 
		city_data = api.restaurants(:city => dest.city)
		restaurants = city_data['restaurants']
		# {"id"=>7267, "name"=>"10pin Bowling Lounge", 
		# "address"=>"330 N State Street", "city"=>"Chicago", 
		# "state"=>"IL", "area"=>"Chicago / Illinois", 
		# "postal_code"=>"60610", "country"=>"US", 
		# "phone"=>"3126440300x", "lat"=>41.888634, 
		# "lng"=>-87.628091, "price"=>4, 
		# "reserve_url"=>"http://www.opentable.com/single.aspx?rid=7267", "mobile_reserve_url"=>"http://mobile.opentable.com/opentable/?restId=7267", "image_url"=>"https://www.opentable.com/img/restimages/7267.jpg"}
		restaurants.collect do |restaurant|
			attributes = {name: restaurant["name"], address: restaurant["address"], price: restaurant["price"]}
			Restaurant.find_or_create_by(attributes)
		end

    end


end
