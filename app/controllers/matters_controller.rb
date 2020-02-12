class MattersController < ApplicationController
  before_action :set_matter, only: [:edit, :show]

  def index
    @matters = Matter.all.order("created_at DESC")
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
  end

  def edit
  end

  def update
    @matter_edit = Matter.find_by(id: params[:id])
    @matter_edit.update(matter_params)
  end

  private
  def matter_params
    params.require(:matter).permit(:title, :reward, :deadline, :start, :end, :content, :payment, :supplement, :status).merge(musician_id: current_user.musician.id)
  end

  def set_matter
    @matter = Matter.find(params[:id])
  end

end
