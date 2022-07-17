class User::BikesController < ApplicationController
  def new
    @bike = Bike.new
  end
  
  def create
    bike = Bike.new(bike_params)
    bike.user_id = current_user.id
    bike.save
    redirect_to bike_path(bike.id)
  end
  
  def index
    @bikes = Bike.all
    @users = User.all
  end
  
  def show
    @bike = Bike.find(params[:id])  
  end
  
  def destroy
    bike = Bike.find(params[:id]) 
    bike.destroy
    redirect_to '/bikes' 
  end
  
  # 投稿データのストロングパラメータ
  private

  def bike_params
    params.require(:bike).permit(:bike_image, :manufacturer, :bike_name, :first_impression, :body)
  end
end
