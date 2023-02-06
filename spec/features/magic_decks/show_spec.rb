require 'rails_helper'

RSpec.describe 'MagicDeck show page' do
  describe "As a visitor" do

    before do
      @magic_deck_1 = MagicDeck.create!(name: "Cycle of Death", format: "Standard", minimum_card_count: 60, qualifies: true)
      
      @card_1 = Card.create!(name: "Henrika Domnathi", mana_cost: 4, card_type: "Legendary Creature", archtype: "Vampire", rarity: "MR", power_toughness: "1/3", expansion: "VOW", legal: true, magic_deck_id: @magic_deck_1.id)
      @card_2 = Card.create!(name: "Necroduality", mana_cost: 4, card_type: "Enchantment", rarity: "MR", expansion: "VOW", legal: true, magic_deck_id: @magic_deck_1.id)
    end
  
    context "When I visit '/parents/:id'" do
      it "can see the parent with that id including the parent's attributes" do
      
        visit "/magic_decks/#{@magic_deck_1.id}"
     
        expect(page).to have_content(@magic_deck_1.name)
        expect(page).to have_content("Minimum Card Count: #{@magic_deck_1.minimum_card_count}")
        expect(page).to have_content("Format: #{@magic_deck_1.format}")
        expect(page).to have_content("Legal? - #{@magic_deck_1.qualifies}")
      end
    end

    context "When I visit a parent's show page" do
      it "I see a count of the number of children associated with this parent" do
      
        visit "/magic_decks/#{@magic_deck_1.id}"
        
        expect(page).to have_content("This deck has: #{@magic_deck_1.cards.count} cards")
      end
    end
  end
end

# [X] done

# User Story 2, Parent Show 

# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes
# (data from each column that is on the parent table)
