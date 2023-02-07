require 'rails_helper'

RSpec.describe 'Cards index page' do
  describe "As a visitor" do
    before :each do
      @magic_deck_1 = MagicDeck.create!(name: "Cycle of Death", format: "Standard", minimum_card_count: 60, qualifies: true)
      
      @card_1 = Card.create!(name: "Henrika Domnathi", mana_cost: 4, card_type: "Legendary Creature", archtype: "Vampire", rarity: "MR", power_toughness: "1/3", expansion: "VOW", legal: true, magic_deck_id: @magic_deck_1.id)
      @card_2 = Card.create!(name: "Necroduality", mana_cost: 4, card_type: "Enchantment", rarity: "MR", expansion: "VOW", legal: true, magic_deck_id: @magic_deck_1.id)
      # magic_deck_id: @magic_deck_1.id
    end

    context "When I visit '/child_table_name'" do
      it "can see each Child in the system including the Child's attributes" do
        
        visit '/cards'
        
        expect(page).to have_content(@card_1.name)
        expect(page).to have_content(@card_2.name)
        expect(page).to have_content("Mana Cost: #{@card_1.mana_cost}")
        expect(page).to have_content("Mana Cost: #{@card_2.mana_cost}")
        expect(page).to have_content("Type: #{@card_1.card_type}")
        expect(page).to have_content("Type: #{@card_2.card_type}")
        expect(page).to have_content("Rarity: #{@card_1.rarity}")
        expect(page).to have_content("Rarity: #{@card_2.rarity}")
        expect(page).to have_content("Power/Toughness: #{@card_1.power_toughness}")
        expect(page).to have_content("Power/Toughness: #{@card_2.power_toughness}")
        expect(page).to have_content("Expansion: #{@card_1.expansion}")
        expect(page).to have_content("Expansion: #{@card_2.expansion}")
        expect(page).to have_content("Legal? - #{@card_1.legal}")
        expect(page).to have_content("Legal? - #{@card_2.legal}")
      end
    end

    context 'When I visit any page on the site' do
      it 'can see a link at the top of the page that takes me to the Child Index' do
        
        visit '/magic_decks'

        click_link('Cards Index')
        expect(current_path).to eq('/cards')
      end
    end
  end
end

# [X] done

# User Story 3, Child Index 

# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes
# (data from each column that is on the child table)

# [X] done

# User Story 8, Child Index Link

# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Child Index

