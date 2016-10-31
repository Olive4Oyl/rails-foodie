class UsersController < ApplicationController
	before_action :set_user, only: [:show, :update]
	
	def index
		@users = User.all
	end

	def new
	end

	def create

	end

	def show
	
	end

	def edit

	end

	def update
		@user = User.find_by(id: params[:id])
		if user_signed_in? && current_user == @user
			current_user.update(user_params)
		end
		redirect_to user_path(current_user)
	end

	def destroy 
	end

	private

	def user_params
		params.require(:user).permit(:name)
	end

	def set_user
		@user = User.find_by(id: params[:id])
	end

end