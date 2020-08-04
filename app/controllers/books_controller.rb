class BooksController < ApplicationController

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
			redirect_to book_path(@book.id)
	   	else
	   		@books = Book.all
	   		render "index"
	  end
	end

  	def show
  	# 部分テンプレート
		@book = Book.new
    	@user = current_user
    # ページ内容
		@books = Book.find(params[:id])
	end

	def edit
    	@book = Book.find(params[:id])
    end

	def update
		book = Book.find(params[:id])
		book.update(book_params)
		redirect_to user_path(user)
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
end
