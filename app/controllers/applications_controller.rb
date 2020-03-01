class ApplicationsController < ApplicationController

  def create
    current_user.applications.create(matter_id: params[:matter_id])
  end

  def destroy
    @application = Application.find_by(matter_id: params[:matter_id], user_id: current_user.id)
    @application.destroy
  end

end
