class ProfilesController < ApplicationController
  def update
    @profile = User.find(params[:id])
    @profile.update(profile_params)
    redirect_to profile_path(@profile.id)
  end

  def show
    @profile = User.find(params[:id])
  end

  def edit
    @profile = User.find(params[:id])
  end
  private
  def profile_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
