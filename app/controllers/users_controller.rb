class UsersController < ApplicationController
  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to user_path
  end

  def index
    @book = Book.new
    @books = Book.where(user_id: current_user)
    @user = current_user
    @users = User.all
	end

	def show
    @book = Book.new
    @users = User.all
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
  	def book_params
    	params.require(:user).permit(:name, :introduction, :profile_image)
  	end
end
