class Musician < ApplicationRecord
  has_many :matters
  has_many :chats
  has_many :messages
  belongs_to :user
  has_one :block
end
