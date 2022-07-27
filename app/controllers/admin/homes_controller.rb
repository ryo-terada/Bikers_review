class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  #管理側はレビュー一覧ページを"bikes_controller"では管理しない。
  def top
    @bikes = Bike.page(params[:page])
  end
end
