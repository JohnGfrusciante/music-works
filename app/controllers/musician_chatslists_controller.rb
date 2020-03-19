class MusicianChatslistsController < ApplicationController

  def index
    @matter_id = Matter.where(musician_id: current_user.musician.id)
    @chat_lists = Chat.where(matter_id: @matter_id).order("created_at DESC")
    @messages = Message.where(chat_id: @chat_lists).order("created_at DESC")
    @not_musician_messages = @messages.where.not(user_id: current_user.id)
    @unread_messages = @not_musician_messages.where(status: 0)
    @musician_user_id = Musician.find_by(user_id: current_user)
  end

end

