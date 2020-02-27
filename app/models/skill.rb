class Skill < ApplicationRecord
  has_many :users, through: :tags
  has_many :tags
end
