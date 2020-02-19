class MessagesController < ApplicationController

  before_action :set_matter, only: [:index, :create, :edit, :update, :destroy]
  before_action :set_chat, only: [:index, :create, :edit, :update, :destroy]

  def index
    @message = Message.new
    @messages = Message.where(chat_id: @chat.id).order("created_at DESC")
  end

  def create
    @message = Message.new(message_params)
    @message.save!
    redirect_to controller: :messages, action: :index
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    message_edit = Message.find(params[:id])
    message_edit.update(message_params)
    redirect_to controller: :messages, action: :index
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    redirect_to controller: :messages, action: :index
  end


  def already_read
    message = Message.find(params[:message_id])
    message.status = 1
    message.save!
    redirect_to controller: :messages, action: :index
  end

  def unread
    message = Message.find(params[:message_id])
    message.status = 0
    message.save!
    redirect_to controller: :messages, action: :index
  end


  private
  def message_params
    params.require(:message).permit(:content, :status).merge(user_id: current_user.id, chat_id: @chat.id)
  end


  def set_matter
    @matter = Matter.find(params[:matter_id])
  end

  def set_chat
    @chat = Chat.find_by(matter_id: @matter.id, user_id: current_user.id)
  end

end
