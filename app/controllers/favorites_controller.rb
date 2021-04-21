class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.new(picture_id: params[:picture_id])
    favorite.save
    redirect_to picture_path(params[:picture_id])
  end

  def destroy
    favorite = Favorite.find_by(picture_id: params[:picture_id], user_id: current_user.id)
    favorite.destroy
    redirect_to picture_path(params[:picture_id])
  end
end
