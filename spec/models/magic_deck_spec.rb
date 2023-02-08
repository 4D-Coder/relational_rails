require 'rails_helper'

RSpec.describe MagicDeck, type: :model do
  let(:magic_deck_1) { MagicDeck.create!(name: "Cycle of Death", format: "Standard", minimum_card_count: 60, qualifies: true, created_at: Time.now - 3.hour) }
  let(:magic_deck_2) { MagicDeck.create!(name: "Treasury", format: "Historic", minimum_card_count: 60, qualifies: true, created_at: Time.now - 1.hour ) }
  let(:magic_deck_3) { MagicDeck.create!(name: "Newest Vampires", format: "Commander", minimum_card_count: 100, qualifies: true, created_at: Time.now - 2.hour ) }

  describe 'child relationship' do 
    it {should have_many :cards}
  end

  describe '#desc_order' do
    it 'can order data in desc order based on time created' do
      # require 'pry'; binding.pry
      expect(MagicDeck.desc_order).to eq(MagicDeck.order(created_at: :desc))
    end
  end
end