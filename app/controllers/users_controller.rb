class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.save
		redirect_to user_path
	end
	private
	def user_params
		params.require(:user).permit(:name, :image, :introduction)
	end
end
