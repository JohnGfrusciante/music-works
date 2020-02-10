class MusiciansController < ApplicationController
  def index
  end

  def new
      @musician = Musician.new
  end

  def create
    # @musician = Musician.create(musician_params)
    @musician = Musician.new(musician_params)
    @musician.save!
  end

  def edit
  end

  def update
  end

  private
  def musician_params
    params.require(:musician).permit(:image, :name, :biography, :activity_history, :activity_place, :email, :sound_source, :homepage, :twitter, :facebook, :other_link, :live_info, :office).merge(user_id: current_user.id)
  end

end
