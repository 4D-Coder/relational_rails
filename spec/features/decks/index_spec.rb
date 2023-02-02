require 'rails_helper'

RSpec.describe 'MagicDeck index page', type: :feature do
  it "can see the name of each parent record in the system" do
    magic_deck_1 = MagicDeck.create!(name: "Cycle of Death", format: "Standard", minimum_card_count: 60, qualifies: true )
    magic_deck_2 = MagicDeck.create!(name: "Treasury", format: "Historic", minimum_card_count: 60, qualifies: true )
    magic_deck_3 = MagicDeck.create!(name: "Newest Vampires", format: "Commander", minimum_card_count: 100, qualifies: true )

    visit "/magic_decks"

    expect(page).to have_content(magic_deck_1.name)
    expect(page).to have_content(magic_deck_2.name)
    expect(page).to have_content(magic_deck_3.name)
  end
end

# [X] done

# User Story 1, Parent Index 

# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system
