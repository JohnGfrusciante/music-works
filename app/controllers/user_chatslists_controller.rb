class UserChatslistsController < ApplicationController

  def index
    @chat_lists = Chat.where(user_id: current_user.id).order("created_at DESC")
    @messages = Message.where(chat_id: @chat_lists).order("created_at DESC")
    @not_user_messages = @messages.where.not(user_id: current_user.id)
    @unread_messages = @not_user_messages.where(status: 0)
    @musician_user_id = Musician.find_by(user_id: current_user)
  end

end
