class MagicDeck < ApplicationRecord
  has_many :cards, dependent: :destroy
end