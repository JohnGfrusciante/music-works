class Tag < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  def self.search(search)
    if search
      Tag.where(['skill_id LIKE ?', "%#{search}%"])
    else
      Tag.all
    end
  end
end
