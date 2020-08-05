class UsersController < ApplicationController

  def top
  end

  def about
  end

  def index
    # 部分テンプレート
    @book = Book.new
    @user = current_user
    # ページ内容
    @users = User.all
  end

  def create
    # 部分テンプレート
    @book = Book.new(book_params)
    @book.user_id = current_user
      if  @book.save
          flash[:notice] = "You have creatad book successfully."
          redirect_to user_path(@book.id)
      else
          # @book = Book.new
          # render :index
          redirect_to books_path
      end
  end

	def show
    # 部分テンプレート
    @book = Book.new
    @user = User.find(params[:id])
    # ページ内容
    @books = @user.books
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    @user.update(book_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
  end

  	private
  	def book_params
    	params.require(:user).permit(:name, :introduction, :profile_image)
  	end
end
