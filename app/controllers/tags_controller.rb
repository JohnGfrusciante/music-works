class TagsController < ApplicationController
  before_action :set_musician, only: [:index, :user_search]

  def index
    
  end

  def user_search
    @user_skill_searchs = Tag.where(skill_id: params[:skill_id])
    @musician_user_id = Musician.find_by(user_id: current_user)
  end


  private

  def set_musician
    @musician = Musician.find(params[:musician_id])
  end

end
