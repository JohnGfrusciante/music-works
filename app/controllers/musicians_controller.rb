class MusiciansController < ApplicationController
  before_action :set_musician, only: [:edit, :show, :update]

  def index

  end

  def new
    @musician = Musician.new
  end

  def create
    @musician = Musician.new(musician_params)
    @musician.save!
  end

  def show
    @chat = Chat.where(matter_id: current_user.musician.matters.ids)
    @messages = Message.where(chat_id: @chat.ids)
    @not_musician_messages = @messages.where.not(user_id: current_user.id)
    @unread_messages = @not_musician_messages.where(status: 0)
  end

  def edit
  end

  def update
    @musician = Musician.update(musician_params)
  end

  private
  def musician_params
    params.require(:musician).permit(:image, :name, :biography, :activity_history, :activity_place, :email, :homepage, :youtube, :spotify, :apple_music, :twitter, :facebook, :otherlink_title, :otherlink_url, :live_info, :office).merge(user_id: current_user.id)
  end

  def set_musician
    @musician = Musician.find(params[:id])
  end

end
