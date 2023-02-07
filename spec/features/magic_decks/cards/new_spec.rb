require 'rails_helper'

RSpec.describe 'MagicDeckCards new page' do
  before :each do
    let!(:magic_deck_1) { MagicDeck.create!(name: "Cycle of Death", format: "Standard", minimum_card_count: 60, qualifies: true, created_at: Time.now - 3.hour) }
    let!(:magic_deck_2) { MagicDeck.create!(name: "Treasury", format: "Historic", minimum_card_count: 60, qualifies: true, created_at: Time.now - 1.hour ) }
    let!(:magic_deck_3) { MagicDeck.create!(name: "Newest Vampires", format: "Commander", minimum_card_count: 100, qualifies: true, created_at: Time.now - 2.hour ) }
  end

  describe "As a visitor" do
    context "When I visit a Parent Children Index page" do
      it "can" do
        
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

    context "When I visit a parent show page" do
      it "can see a link to take me to that parent's `child_table_name` page" do

        visit "/magic_decks/#{@magic_deck_1.id}"
        
        save_and_open_page
        click_link("#{@magic_deck_1.name}")
        expect(current_path).to eq("/magic_decks/#{@magic_deck_1.id}/cards")
      end
    end
  end
end


# [ ] done

# User Story 13, Parent Child Creation 

# As a visitor
# - magic_decks/cards/index_spec.rb -
# [When I visit a Parent Children Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child]
# - magic_decks/cards/new_spec.rb -
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed]