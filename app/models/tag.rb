class Tag < ApplicationRecord
  belongs_to :user
  belongs_to :matter_category
end
