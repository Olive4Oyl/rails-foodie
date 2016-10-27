class ReservationsController < ApplicationController
	require "models/open_table"
	include OpenTable
end
