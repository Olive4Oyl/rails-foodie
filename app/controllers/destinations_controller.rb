class DestinationsController < ApplicationController
 require "open_table"
 include OpenTable

 def index
 	@destinations = Destination.search(params[:term])
 end

 def create
 end


 private
 def destiantion_params
  params.require(:destination).permit(:term)
end

end
