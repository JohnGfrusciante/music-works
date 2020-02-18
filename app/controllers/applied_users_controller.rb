class AppliedUsersController < ApplicationController

  def index
    @applied = Application.find(params[:application_id])
    @user = User.find_by(id: @applied.user_id)
  end

end
