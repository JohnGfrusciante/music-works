class Matter < ApplicationRecord
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :applications
  has_many :offers
  has_many :chats
  belongs_to :musician
  belongs_to :matter_category

  enum status: {
    公開:0,非公開:1
  }, _prefix: true

  def self.search(search)
    if search
      Matter.joins(:musician).where(['title LIKE ? OR content LIKE ? OR name LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      Matter.all
    end
  end
end
