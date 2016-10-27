class WelcomeController < ApplicationController
 	require "open_table"
 	include OpenTable

	def index
		@api = OpenTable::Client.new 
		@y = @api.countries
		@countries = @y['countries']
	end

end 