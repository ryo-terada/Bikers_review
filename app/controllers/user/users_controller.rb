class User::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @bikes = @user.bikes.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def unsubscribe
    @user = User.find(params[:id])
    if @user == current_user
      # 退会確認画面への移動
      render "unsubscribe"
    else
      redirect_to user_path(current_user)
    end
  end

  def withdrawal
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "You have withdrawn user successfully"
    redirect_to root_path
    # アカウントは物理削除されない
    # is_deletedカラムをtrueに変更することにより退会フラグを立てる
  end

  # ユーザーデータのストロングパラメーター
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :user_image, :is_deleted)
  end
end
