class ApplicationsListsController < ApplicationController

  def index
    @applications = Application.where(user_id: current_user.id).order("created_at DESC")
  end

end
