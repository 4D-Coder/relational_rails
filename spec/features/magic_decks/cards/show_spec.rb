require 'rails_helper'

RSpec.describe 'MagicDeckCards show page' do
  describe "As a visitor" do

    before :each do
      @magic_deck_1 = MagicDeck.create!(name: "Cycle of Death", format: "Standard", minimum_card_count: 60, qualifies: true)
      
      @card_1 = @magic_deck_1.cards.create!(name: "Henrika Domnathi", mana_cost: 4, card_type: "Legendary Creature", archtype: "Vampire", rarity: "MR", power_toughness: "1/3", expansion: "VOW", legal: true)
      @card_2 = @magic_deck_1.cards.create!(name: "Necroduality", mana_cost: 4, card_type: "Enchantment", rarity: "MR", expansion: "VOW", legal: true)
    end
    
    context "When I visit a parent's show page" do
      it "sees a count of the number of children associated with this parent" do

        visit "/magic_decks/#{@magic_deck_1.id}"
        
        expect(page).to have_content("This deck has: #{@magic_deck_1.cards.count} cards")
      end
    end

    context "When I visit '/parents/:parent_id/child_table_name'" do
      it "can see each Child in the system including the Child's attributes" do
        
        visit "/magic_decks/#{@magic_deck_1.id}/cards"

        expect(page).to have_content(@card_1.name)
        expect(page).to have_content("Mana Cost: #{@card_1.mana_cost}")
        expect(page).to have_content("Type - Archtype: #{@card_1.card_type} - #{@card_1.archtype}")
        expect(page).to have_content("Rarity: #{@card_1.rarity}")
        expect(page).to have_content("Power/Toughness: #{@card_1.power_toughness}")
        expect(page).to have_content("Expansion: #{@card_1.expansion}")
        expect(page).to have_content("Legal? - #{@card_1.legal}")
        expect(page).to have_content(@card_2.name)
        expect(page).to have_content("Mana Cost: #{@card_2.mana_cost}")
        expect(page).to have_content("Type - Archtype: #{@card_2.card_type} - #{@card_2.archtype}")
        expect(page).to have_content("Rarity: #{@card_2.rarity}")
        expect(page).to have_content("Power/Toughness: #{@card_2.power_toughness}")
        expect(page).to have_content("Expansion: #{@card_2.expansion}")
        expect(page).to have_content("Legal? - #{@card_2.legal}")
      end
    end
  end
end

# [X] done

# User Story 5, Parent Children Index 

# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes
# (data from each column that is on the child table)


# [X] done

# User Story 7, Parent Child Count

# As a visitor
# When I visit a parent's show page
# I see a count of the number of children associated with this parent