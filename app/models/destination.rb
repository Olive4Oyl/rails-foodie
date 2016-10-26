class Destination < ApplicationRecord
	has_many :user_destinations
	has_many :users, through: :user_destinations
	has_many :restaurants

end
