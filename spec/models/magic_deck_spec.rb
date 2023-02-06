require 'rails_helper'

RSpec.describe MagicDeck, type: :model do
  before :each do
    @magic_deck_1 = MagicDeck.create!(name: "Cycle of Death", format: "Standard", minimum_card_count: 60, qualifies: true, created_at: Time.now - 3.hour)
    @magic_deck_2 = MagicDeck.create!(name: "Treasury", format: "Historic", minimum_card_count: 60, qualifies: true, created_at: Time.now - 1.hour )
    @magic_deck_3 = MagicDeck.create!(name: "Newest Vampires", format: "Commander", minimum_card_count: 100, qualifies: true, created_at: Time.now - 2.hour )
  end
  
  describe 'child relationship' do 
    it {should have_many :cards}
  end
end

# [X] done

# User Story 6, Parent Index sorted by Most Recently Created 

# As a visitor
# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created