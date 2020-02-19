class MypagesController < ApplicationController

  before_action :set_user, only: [:index]

  def index
    @chat = Chat.where(user_id: current_user.id)
    @messages = Message.where(chat_id: @chat.ids)
    @not_user_messages = @messages.where.not(user_id: current_user.id)
    @unread_messages = @not_user_messages.where(status: 0)
  end


  private

  def set_user
    @user = User.find_by(id: current_user.id)
  end

end
