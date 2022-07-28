class User::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :ensure_user, except: [:index]

  def index
    @users = User.page(params[:page])
  end

  def show
    @bikes = @user.bikes.page(params[:page])
  end

  def edit
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def unsubscribe
    if @user == current_user
      # 退会確認画面への移動
      render "unsubscribe"
    else
      redirect_to user_path(current_user)
    end
  end

  def withdrawal
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "You have withdrawn user successfully"
    redirect_to root_path
    # アカウントは物理削除されない
    # is_deletedカラムをtrueに変更することにより退会フラグを立てる
  end
  
  def ensure_user
    @user = User.find(params[:id])
  end

  # ユーザーデータのストロングパラメーター
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :user_image, :is_deleted)
  end
end
