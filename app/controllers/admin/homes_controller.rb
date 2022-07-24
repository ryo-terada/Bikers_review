class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
    @bikes = Bike.page(params[:page])
  end
end
