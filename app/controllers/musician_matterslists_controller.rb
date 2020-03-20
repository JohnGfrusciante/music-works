class MusicianMatterslistsController < ApplicationController
  def index
    @matters = Matter.where(musician_id: current_user.musician.id).order("created_at DESC")
    @musician_user_id = Musician.find_by(user_id: current_user)
  end
end
