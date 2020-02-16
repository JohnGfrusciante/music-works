class UserChatslistsController < ApplicationController

  def index
    @chat_lists = Chat.where(user_id: current_user.id).order("created_at DESC")
  end

end
