require 'rails_helper'

RSpec.describe 'MagicDeck show page' do
  it "can see the child with that id including the child's attributes" do
    @magic_deck = MagicDeck.create!(name: "Cycle of Death", format: "Standard", minimum_card_count: 60, qualifies: true )
    @card = Card.create!(name: "Necroduality", mana_cost: 4, card_type: "Enchantment", rarity: "MR", expansion: "VOW", legal: true, magic_deck_id: @magic_deck.id)

    visit "/cards/#{@card.id}"

    expect(page).to have_content(@card.name)
    expect(page).to have_content(@card.mana_cost)
    expect(page).to have_content(@card.card_type)
    expect(page).to have_content(@card.rarity)
    expect(page).to have_content(@card.expansion)
    expect(page).to have_content(@card.legal)
  end
end


# [ ] done

# User Story 4, Child Show 

# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes
# (data from each column that is on the child table)
