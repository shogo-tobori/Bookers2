class BooksController < ApplicationController
	def new
	end
	def index
	  @books = Book.all
	  @book = Book.new
	  @user = current_user
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
	@book = Book.find(params[:id])
	end

	private
	def book_params
		params.require(:book).permit(:title,:body)
	end
end