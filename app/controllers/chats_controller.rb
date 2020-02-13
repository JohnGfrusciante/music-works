class ChatsController < ApplicationController

  def create
    @matter = Matter.find(params[:matter_id])
    @chat = Chat.new(matter_id: @matter.id, user_id: current_user.id)
    @chat.save!
    redirect_to controller: 'messages', action: 'index'
  end

end
