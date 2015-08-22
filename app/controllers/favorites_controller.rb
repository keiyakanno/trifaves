class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]
  
  def create
    @favorite = current_user.favorites.build(favorite_params)
    # binding.pry
    if @favorite.save
      flash[:success] = "Favorite created!"
    end
    redirect_to new_favorite_detail_path(favorite: @favorite, detail: 1)
  end
  
  def show
    @favorite = Favorite.find(params[:id])
  end
  
  def new
    if user_signed_in?
      @favorite = current_user.favorites.new
    end
  end
  
  private
  def favorite_params
    params.require(:favorite).permit(:title, :description, favorite_details_attributes: [:id, :description])
  end
  
end