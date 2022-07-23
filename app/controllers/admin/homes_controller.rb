class Admin::HomesController < ApplicationController
  def top
    @bikes = Bike.page(params[:page])
  end
end
