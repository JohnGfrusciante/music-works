class MusiciansController < ApplicationController
  def index
  end

  def new
    @user_id = current_user.id
    if @user_id.present?
      # redirect_to root_path
      # ===ここからテスト用記述===================================
      @musician = Musician.new
      # テスト用記述は、アーティスト登録終了後に削除し、redirect_to root_path のコメントアウトを外してください。
      # また、musician.brのモデルファイルの validates :user_id, uniqueness: true のコメントアウトも外してください。
      # ===ここまでテスト用記述===================================
    else
      @musician = Musician.new
    end
  end

  def create
    # @musician = Musician.create(musician_params)
    @musician = Musician.new(musician_params)
    @musician.save!
  end

  def edit
  end

  def update
  end

  private
  def musician_params
    params.require(:musician).permit(:image, :name, :biography, :activity_history, :activity_place, :email, :sound_source, :homepage, :twitter, :facebook, :other_link, :live_info, :office).merge(user_id: current_user.id)
  end

end
