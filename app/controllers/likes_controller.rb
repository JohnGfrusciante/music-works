class LikesController < ApplicationController

  def index
     @likes = Like.where(user_id: current_user.id).order("created_at DESC")
     @musician_user_id = Musician.find_by(user_id: current_user)
  end

  def create
    current_user.likes.create(matter_id: params[:matter_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(matter_id: params[:matter_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end

end
