class UsersController < ApplicationController
  before_action :authenticate_user!, except:[:top, :about]
  before_action :corrent_user, only: [:edit, :update]


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

	def show
    # 部分テンプレート
    @book = Book.new
    @user = User.find(params[:id])
    # ページ内容
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if  @user.update(user_params)
        flash[:notice] = "You have updated user successfully."
        redirect_to user_path(@user.id)
    else
        render "edit"
    end
  end

  private
  	def user_params
    	params.require(:user).permit(:name, :introduction, :profile_image)
  	end

  private
    def corrent_user
      user = User.find(params[:id])
      if current_user != user
        redirect_to user_path(current_user)
      end
    end
end
