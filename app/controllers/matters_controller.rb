class MattersController < ApplicationController
  before_action :set_matter, only: [:edit, :show]
  before_action :set_deadline, only: [:index, :show]

  PER = 3

  def index
    @matters = Matter.page(params[:page]).per(PER).order("created_at DESC")
    @musician_user_id = Musician.find_by(user_id: current_user)
  end

  def new
    @matter = Matter.new
  end

  def create
    @matter = Matter.new(matter_params)
    @matter.save!
  end

  def show
    @musician_user_id = Musician.find_by(user_id: current_user)
    @chat_user_id = Chat.find_by(matter_id: @matter, user_id: current_user)
    if user_signed_in?
      @chat = Chat.find_by(matter_id: @matter.id, user_id: current_user.id)
    end
  end

  def edit
  end

  def update
    @matter_edit = Matter.find_by(id: params[:id])
    @matter_edit.update(matter_params)
  end


  def search
    @matter_searchs = Matter.search(params[:search_word])
  end

  def category_search
    @matter_category_searchs = Matter.where(matter_category_id: params[:matter_category_id])
  end

  private
  def matter_params
    params.require(:matter).permit(:title, :reward, :deadline, :start, :end, :content, :payment, :supplement, :status, :matter_category_id).merge(musician_id: current_user.musician.id)
  end

  def set_matter
    @matter = Matter.find(params[:id])
  end

  def set_deadline
    @deadline = Time.zone.now - 1.days
  end

end
