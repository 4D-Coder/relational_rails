require 'rails_helper'

RSpec.describe 'MagicDeck edit page', type: :feature do
  before :each do
    @magic_deck_1 = MagicDeck.create!(name: "Cycle of Death", format: "Standard", minimum_card_count: 60, qualifies: true, created_at: Time.now - 3.hour)
    @magic_deck_2 = MagicDeck.create!(name: "Treasury", format: "Historic", minimum_card_count: 60, qualifies: true, created_at: Time.now - 1.hour )
    @magic_deck_3 = MagicDeck.create!(name: "Newest Vampires", format: "Commander", minimum_card_count: 100, qualifies: true, created_at: Time.now - 2.hour )
    @magic_deck_4 = MagicDeck.create!(name: "UnDeAD HUnGEr", format: "Comeander", minimum_card_count: 100, qualifies: true, created_at: Time.now - 2.hour )
  end

  describe "As a visitor" do
    context "When I visit the Parent Edit page" do
      it "clicks the link to the update page from MagicDeck show and directs viewer to that page" do
    
        visit "/magic_decks/#{@magic_deck_4.id}"

        click_link("Update #{@magic_deck_4.name}")

        expect(current_path).to eq("/magic_decks/#{@magic_deck_4.id}/edit")
      end

      it "can update the Magic Deck show page through the edit action" do
        
        visit "/magic_decks/#{@magic_deck_4.id}"
        expect(page).to have_content("UnDeAD HUnGEr")
        expect(page).to have_content("Comeander")

        click_link("Update #{@magic_deck_4.name}")
        # visit "/magic_decks/#{@magic_deck_4.id}/edit"

        fill_in('name', with: 'Undead Hunger')
        fill_in('format', with: 'Commander / EDH')
        click_button("Save Changes to #{@magic_deck_4.name}")
        
        expect(current_path).to eq("/magic_decks/#{@magic_deck_4.id}")
        expect(page).to have_content('Undead Hunger')
        expect(page).to have_content('Commander / EDH')
      end
    end
  end
end

# [ ] done

# User Story 12, Parent Update 

# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info