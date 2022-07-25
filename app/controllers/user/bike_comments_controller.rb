class User::BikeCommentsController < ApplicationController
  before_action :authenticate_user!, except: [:destroy
  ]
  
  def create
    bike = Bike.find(params[:bike_id])
    comment = current_user.bike_comments.new(bike_comment_params)
    comment.bike_id = bike.id
    if comment.save
      flash[:notice] = "Bike comment was successfully created."
      redirect_to bike_path(bike)
    else
      #@error_comment = comment
      #@bike = Bike.find(params[:bike_id])
      #@bike_comment = BikeComment.new
      #render "user/bikes/show"
      redirect_to bike_path(bike)
    end
  end
  
  def destroy
    BikeComment.find(params[:id]).destroy
    flash[:notice] = "Bike comment was successfully destroyed."
    redirect_to bike_path(params[:bike_id])
  end

  #コメントデータのストロングパラメーター
  private

  def bike_comment_params
    params.require(:bike_comment).permit(:comment)
  end
end
