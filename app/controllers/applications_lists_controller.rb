class ApplicationsListsController < ApplicationController

  def index
    @applications = Application.where(user_id: current_user.id).order("created_at DESC")
    @musician_user_id = Musician.find_by(user_id: current_user)
  end

end
