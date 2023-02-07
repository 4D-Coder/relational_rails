require 'rails_helper'

RSpec.describe 'MagicDeckCards index page' do
  before do
    @magic_deck_1 = MagicDeck.create!(name: "Cycle of Death", format: "Standard", minimum_card_count: 60, qualifies: true)
    
    @card_1 = @magic_deck_1.cards.create!(name: "Henrika Domnathi", mana_cost: 4, card_type: "Legendary Creature", archtype: "Vampire", rarity: "MR", power_toughness: "1/3", expansion: "VOW", legal: true)
    @card_2 = @magic_deck_1.cards.create!(name: "Necroduality", mana_cost: 4, card_type: "Enchantment", rarity: "MR", expansion: "VOW", legal: true)
  end
  
  describe "As a visitor" do
    context "When I visit a Parent Children Index page" do
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
      
      it "has link to add a new adoptable child for the parent 'Create Child' and takes user to a form" do
        visit "/magic_decks/#{@magic_deck_1.id}/cards"

        click_link("Create New Card Entry")
        
        expect(current_path).to eq("/magic_decks/#{@magic_deck_1.id}/cards/new")
        expect(page).to have_field("name")
        expect(page).to have_field("mana_cost")
        expect(page).to have_field("card_type")
        expect(page).to have_field("archtype")
        expect(page).to have_field("rarity")
        expect(page).to have_field("power_toughness")
        expect(page).to have_field("expansion")
        choose('legal_true')
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

# User Story 10, Parent Child Index Link

# As a visitor
# When I visit a parent show page ('/parents/:id')
# Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')

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