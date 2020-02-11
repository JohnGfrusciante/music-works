class MusiciansController < ApplicationController
  before_action :set_musician, only: [:edit, :show, :update]

  def index
    
  end

  def new
    @musician = Musician.new
  end

  def create
    @musician = Musician.new(musician_params)
    @musician.save!
  end

  def show
    
  end

  def edit
  end

  def update
    @musician = Musician.update(musician_params)
  end

  private
  def musician_params
    params.require(:musician).permit(:image, :name, :biography, :activity_history, :activity_place, :email, :homepage, :youtube, :spotify, :apple_music, :twitter, :facebook, :otherlink_title, :otherlink_url, :live_info, :office).merge(user_id: current_user.id)
  end

  def set_musician
    @musician = Musician.find(params[:id])
  end

end
