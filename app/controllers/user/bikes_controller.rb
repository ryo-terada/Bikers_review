class User::BikesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user_id = current_user.id
    if @bike.save
      redirect_to bike_path(@bike)
    else
      render :new
    end
  end

  def index
    @bikes = Bike.page(params[:page])
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
