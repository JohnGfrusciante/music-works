class TagsController < ApplicationController
  before_action :set_musician, only: [:index, :user_search]

  def index
    
  end

  def user_search
    @user_skill_searchs = Tag.where(skill_id: params[:skill_id])
  end


  private

  def set_musician
    @musician = Musician.find(params[:musician_id])
  end

end
