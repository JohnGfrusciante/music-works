class Chat < ApplicationRecord
  has_many :messages
  belongs_to :matter
  belongs_to :user
  belongs_to :musician
end
