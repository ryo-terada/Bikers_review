class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @bikes = @user.bikes.page(params[:page])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to admin_user_path(@user.id)
    # 管理側では、全てのユーザーの会員ステータス（会員or退会）の選択ができる
  end
  
  # ユーザーデータのストロングパラメーター
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :user_image, :is_deleted)
  end
end
