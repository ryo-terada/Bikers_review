class User::FavoritesController < ApplicationController
  def create
    bike = Bike.find(params[:bike_id])
    favorite = current_user.favorites.new(bike_id: bike.id)
    favorite.save
    redirect_to bike_path(bike)
  end

  def destroy
    bike = Bike.find(params[:bike_id])
    favorite = current_user.favorites.find_by(bike_id: bike.id)
    favorite.destroy
    redirect_to bike_path(bike)
  end
end
