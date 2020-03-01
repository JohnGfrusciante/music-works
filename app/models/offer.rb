class Offer < ApplicationRecord
  validates :user_id, uniqueness: { scope: :matter_id }
  belongs_to :user
  belongs_to :matter
end
