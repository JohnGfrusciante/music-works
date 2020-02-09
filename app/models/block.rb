class Block < ApplicationRecord
  belongs_to :musician
  belongs_to :user
end
