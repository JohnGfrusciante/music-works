class TagsController < ApplicationController

  def index
  end

  def user_search
    @user_skill_searchs = Tag.where(skill_id: params[:skill_id])
    @musician = Musician.find(params[:musician_id])
  end
end
