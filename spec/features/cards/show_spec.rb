require 'rails_helper'

RSpec.describe 'Cards show page' do
  describe "As a visitor" do
    context "When I visit '/child_table_name/:id'" do
      it "can see the child with that id including the child's attributes" do
        @magic_deck = MagicDeck.create!(name: "Cycle of Death", format: "Standard", minimum_card_count: 60, qualifies: true )
        card = Card.create!(name: "Necroduality", mana_cost: 4, card_type: "Enchantment", rarity: "MR", expansion: "VOW", legal: true, magic_deck_id: @magic_deck.id)

        visit "/cards/#{card.id}"

        expect(page).to have_content(card.name)
        expect(page).to have_content("Mana Cost: #{card.mana_cost}")
        expect(page).to have_content("Type - Archtype: #{card.card_type} - #{card.archtype}")
        expect(page).to have_content("Rarity: #{card.rarity}")
        expect(page).to have_content("Power/Toughness: #{card.power_toughness}")
        expect(page).to have_content("Expansion: #{card.expansion}")
        expect(page).to have_content("Legal? - #{card.legal}")
      end
    end
  end
end


# [X] done

# User Story 4, Child Show 

# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes
# (data from each column that is on the child table)

