class Musician < ApplicationRecord
  validates :name, :biography, :activity_history, :activity_place, :email ,presence: true
  # validates :user_id, uniqueness: true
  has_many :matters
  has_many :chats
  has_many :messages
  belongs_to :user
  has_one :block
end
