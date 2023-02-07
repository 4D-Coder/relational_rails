require 'rails_helper'

RSpec.describe 'MagicDeckCards new page' do
  let!(:magic_deck_1) { MagicDeck.create!(name: "Cycle of Death", format: "Standard", minimum_card_count: 60, qualifies: true, created_at: Time.now - 3.hour) }
  let!(:magic_deck_2) { MagicDeck.create!(name: "Treasury", format: "Historic", minimum_card_count: 60, qualifies: true, created_at: Time.now - 1.hour ) }
  let!(:magic_deck_3) { MagicDeck.create!(name: "Newest Vampires", format: "Commander", minimum_card_count: 100, qualifies: true, created_at: Time.now - 2.hour ) }

  describe "As a visitor" do
    context "When I fill in the form with the child's attributes" do
      it 'POSTs changes, and redirects user to magic_decks_cards index' do
        visit "/magic_decks/#{magic_deck_2.id}/cards/new"

        fill_in('name', with: 'Toski, Bearer of Secrets')
        fill_in('mana_cost', with: 4)
        fill_in('card_type', with: 'Legendary Creature')
        fill_in('archtype', with: 'Squirrel')
        fill_in('rarity', with: 'R')
        fill_in('power_toughness', with: '1/1')
        fill_in('expansion', with: 'Kaldheim')
        
        choose('legal_true')
        click_button('Create Card Entry')

        new_card = magic_deck_2.cards.last

        expect(current_path).to eq("/magic_decks/#{magic_deck_2.id}/cards")
        expect(page).to have_content(new_card.name)
        expect(page).to have_content("Mana Cost: #{new_card.mana_cost}")
        expect(page).to have_content("Type - Archtype: #{new_card.card_type} - #{new_card.archtype}")
        expect(page).to have_content("Rarity: #{new_card.rarity}")
        expect(page).to have_content("Power/Toughness: #{new_card.power_toughness}")
        expect(page).to have_content("Expansion: #{new_card.expansion}")
        expect(page).to have_content("Legal? - #{new_card.legal}")
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