class DestinationsController < ApplicationController
 require "open_table"
 include OpenTable

 def index
 end

 def create
 end


 private
 def destiantion_params
  params.require(:destination).permit(:term)
end

end
