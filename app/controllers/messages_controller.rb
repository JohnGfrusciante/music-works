class MessagesController < ApplicationController

  def index
    @matter = Matter.find(params[:matter_id])
    @chat = Chat.find_by(matter_id: @matter.id, user_id: current_user.id)
  end

  def create
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

end
