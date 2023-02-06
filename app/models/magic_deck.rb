class MagicDeck < ApplicationRecord
  has_many :cards, dependent: :destroy

  def self.desc_ordered
    order(created_at: :desc)
  end
end

