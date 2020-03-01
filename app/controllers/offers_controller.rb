class OffersController < ApplicationController
  before_action :set_user, only: [:index, :create, :destroy]
  before_action :set_matter, only: [:index, :create, :destroy]
  before_action :set_musician_offered, only: [:index]
  before_action :set_user_offered, only: [:destroy]

  def index
  end

  def create
    @offer = Offer.new(offer_params)
    unless @offer.valid?
      redirect_to action: :index
    else
      @offer.save!
      redirect_to action: :index
    end
  end


  def destroy
    @offer.destroy
    redirect_to action: :index
  end


  private
  def set_user
    @user = User.find(params[:user_id])
  end

  def set_matter
    @matters = Matter.where(musician_id: current_user.musician.id).order("created_at DESC")
  end

  def set_musician_offered
    @offers = Offer.where(user_id: params[:user_id], matter_id: current_user.musician.matters.ids)
  end

  def set_user_offered
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.permit(:user_id, :matter_id).merge(user_id: params[:user_id], matter_id: params[:matter_id])
  end

end
