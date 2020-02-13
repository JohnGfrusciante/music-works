class ChatsController < ApplicationController

  def create
    @matter = Matter.find(params[:matter_id])
    @chat = Chat.new(matter_id: @matter.id, user_id: current_user.id)
    @chat.save!
    @chat_id = Chat.find_by(matter_id: @matter.id, user_id: current_user.id)
    redirect_to matter_chat_messages_path(chat_id: @chat_id)
  end

end
