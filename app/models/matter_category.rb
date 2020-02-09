class MatterCategory < ApplicationRecord
  has_many :matters
  has_many :users, through: :tags
  has_many :tags
end
