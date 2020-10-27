class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(startup_id: params[:startup_id])
    flash[:success] = "Merci pour votre promotion de la startup #{favorite.startup.name}"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    flash[:success] = "Vous n'êtes plus promoteur de #{favorite.startup.name}"
  end
end
