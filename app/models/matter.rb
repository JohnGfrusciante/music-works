class Matter < ApplicationRecord
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :applications
  has_many :chats
  belongs_to :musician
  belongs_to :matter_category
  def self.search(search)
    if search
      Matter.where(['title LIKE ? OR content LIKE ?', "%#{search}%", "%#{search}%"])
    else
      Matter.all
    end
  end
end

