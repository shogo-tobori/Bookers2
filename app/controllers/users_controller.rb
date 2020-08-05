class UsersController < ApplicationController
# 確認OK
  def top
  end
# 確認OK
  def about
  end
# 確認OK
  def index
    # 部分テンプレート
    @book = Book.new
    @user = current_user
    # ページ内容
    @users = User.all
  end
# 確認OK
  def create
    # 部分テンプレート
    @book = Book.new(book_params)
    @book.user_id = current_user
      if  @book.save
          flash[:notice] = "You have creatad book successfully."
          redirect_to user_path(@book)
      else
          @books = Book.all
          render :index
      end
  end
# 確認OK
	def show
    # 部分テンプレート
    @book = Book.new
    @user = User.find(params[:id])
    # ページ内容
    @books = @user.books
  end
# 確認OK
  def edit
    @user = current_user
  end
# 多分OK
  def update
    @user = User.find(current_user.id)
    if  @user.update(book_params)
        flash[:notice] = "You have updated user successfully."
        redirect_to user_path(@user.id)
    else
        @user = current_user
        render :edit
    end
  end

  	private
  	def book_params
    	params.require(:user).permit(:name, :introduction, :profile_image)
  	end
end
