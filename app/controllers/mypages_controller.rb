class MypagesController < ApplicationController

  before_action :set_user, only: [:index]

  def index
    
  end


  private

  def set_user
    @user = User.find_by(id: current_user.id)
  end


end
