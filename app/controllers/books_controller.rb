class BooksController < ApplicationController
  # before_action :current_user, only: [:edit, :update]
  # before_action :authenticate_user!

  def index
    # 部分テンプレート
    @book = Book.new
    @user = current_user
    # ページ内容
    @books = Book.all
  end

  def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have creatad book successfully"
      redirect_to book_path(@book)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def show
    # 部分テンプレート
    @book = Book.new
    # ページ内容
    @books = Book.find(params[:id])
    @user = @books.user
  end

	def edit
    	@book = Book.find(params[:id])
  end

	def update
		book = Book.find(params[:id])
		book.update(book_params)
    flash[:notice] = "You have updated user successfully."
		redirect_to book_path(book)
	end

	def destroy
		book = Book.find(params[:id])
		book.destroy
		redirect_to books_path
	end

	private
	def book_params
		params.require(:book).permit(:title,:body)
	end

  # private
  #   def current_user
  #     book = Book.find(params[:id])
  #     if  current_user != book.user_id
  #         redirect_to root_path
  #     end
  # end
end
