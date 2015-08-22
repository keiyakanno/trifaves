class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  
  def create
    @favorite = current_user.favorites.build(favorite_params)
    if @favorite.save
      flash[:success] = "Favorite created!"
    end
    redirect_to root_url
  end
  
  def show
    @favorite = Favorite.find(params[:id])
  end
  
  def new
    if user_signed_in?
      @favorite = current_user.favorites.build
    end
  end
  
  private
  def favorite_params
    params.require(:favorite).permit(:title, :description)
  end
  
end