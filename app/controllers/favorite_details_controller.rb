class FavoriteDetailsController < ApplicationController
  
  def create
    prm = favorite_detail_params
    detail = prm[:detail]
    detail_i = detail.to_i
    if detail_i <= 3 then
      favorite_id = prm[:favorite]
      description = prm[:description]
      # binding.pry
      @favorite = Favorite.find(favorite_id.to_i)
      @favorite_detail = @favorite.favorite_details.build(:description => description)
      if @favorite.save
        flash[:success] = "Favorite created!"
      end
      favorite = favorite_detail_params[:favorite]
      detail = favorite_detail_params[:detail]
      if detail_i < 3 then
        redirect_to new_favorite_detail_path(favorite: favorite, detail: detail_i + 1)
      else
        redirect_to root_url
      end
    end

  end
  
  def new
    favorite = Favorite.find(params[:favorite])
    @favorite_detail = favorite.favorite_details.build
    @detail = params[:detail]
    @favorite = params[:favorite]
  end
  
  private
  def favorite_detail_params
    params.require(:favorite_detail).permit(:description, :detail, :favorite)
  end
end