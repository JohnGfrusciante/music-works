class ApplicationsController < ApplicationController

  def create
    current_user.applications.create(matter_id: params[:matter_id])
    @matter = Matter.find_by(id: params[:matter_id])
    @musician_user_id = Musician.find_by(user_id: current_user)
  end

  def destroy
    @application = Application.find_by(matter_id: params[:matter_id], user_id: current_user.id)
    @application.destroy
    @matter = Matter.find_by(id: params[:matter_id])
    @musician_user_id = Musician.find_by(user_id: current_user)
  end

end
