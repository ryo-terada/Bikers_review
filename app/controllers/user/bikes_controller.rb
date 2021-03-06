class User::BikesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :destroy
  ]

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user_id = current_user.id
    if @bike.save
      flash[:notice] = "Bike review was successfully created."
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
    @bike_comment = BikeComment.new
  end

  def destroy
    bike = Bike.find(params[:id])
    bike.destroy
    flash[:notice] = "Bike review was successfully destroyed."
    redirect_to '/bikes'
  end

  # 投稿データのストロングパラメーター
  private

  def bike_params
    params.require(:bike).permit(:bike_image, :manufacturer, :bike_name, :first_impression, :body)
  end
end
