class MattersController < ApplicationController
  def index
  end

  def new
    @matter = Matter.new
  end

  def create
    @matter = Matter.new(matter_params)
    @matter.save!
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  def matter_params
    params.require(:matter).permit(:title, :reward, :deadline, :start, :end, :content, :payment, :supplement, :status).merge(musician_id: current_user.musician.id)
  end

end
