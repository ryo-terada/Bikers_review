class Admin::BikesController < ApplicationController
  before_action :authenticate_admin!

  def show
    @bike = Bike.find(params[:id])
  end

  def destroy
    bike = Bike.find(params[:id])
    bike.destroy
    flash[:notice] = "Bike review was successfully destroyed."
    redirect_to '/admin/top'
    # 削除後のリダイレクト先に注意
  end
end
