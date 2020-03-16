class OfferedListsController < ApplicationController
  before_action :set_offer, only: [:index]

  def index
    @musician_user_id = Musician.find_by(user_id: current_user)
  end

  def already_confirmed
    confirm = Offer.find(params[:offered_list_id])
    confirm.status = 1
    confirm.save!
    redirect_to action: :index
  end

  def unconfirm
    confirm = Offer.find(params[:offered_list_id])
    confirm.status = 0
    confirm.save!
    redirect_to action: :index
  end


  private

  def set_offer
    @offers = Offer.where(user_id: current_user.id)
  end

end
