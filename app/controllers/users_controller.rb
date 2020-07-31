class UsersController < ApplicationController
	def index
		@users = User.all
    @book = Book.new
    @user = current_user
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.save
		redirect_to user_path
	end

	def show
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def edit
    	@user = current_user
  end

  def update
    	@user = User.find(current_user.id)
    	@user.update(user_params)
    	redirect_to user_path(@user.id)
  end


  	private
  	def user_params
    	params.require(:user).permit(:name, :introduction, :profile_image)
  	end
end
