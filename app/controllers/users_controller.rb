class UsersController < ApplicationController

  def index
    # 部分テンプレート
    @book = Book.new
    @user = current_user
    # ページ内容
    @users = User.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to user_path
  end

	def show
    @book = Book.new
    @users = User.all
    @user = current_user
    @books = Book.where(user_id: current_user)
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
