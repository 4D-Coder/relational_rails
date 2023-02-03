require 'rails_helper'

RSpec.describe 'MagicDeck show page' do
  it "can see the parent with that id including the parent's attributes" do
    magic_deck_1 = MagicDeck.create!(name: "Cycle of Death", format: "Standard", minimum_card_count: 60, qualifies: true )
  
    visit "/magic_decks/#{magic_deck_1.id}"
 
    expect(page).to have_content(magic_deck_1.name)
    expect(page).to have_content(magic_deck_1.format)
    expect(page).to have_content(magic_deck_1.minimum_card_count)
    expect(page).to have_content(magic_deck_1.qualifies)
  end
end

# [X] done

# User Story 2, Parent Show 

# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes
# (data from each column that is on the parent table)
