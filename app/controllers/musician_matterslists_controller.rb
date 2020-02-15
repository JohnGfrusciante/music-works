class MusicianMatterslistsController < ApplicationController
  def index
    @matters = Matter.where(musician_id: current_user.musician.id).order("created_at DESC")
  end
end
