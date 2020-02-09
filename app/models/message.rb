class Message < ApplicationRecord
  belongs_to :user
  belongs_to :musician
  belongs_to :chat
end
