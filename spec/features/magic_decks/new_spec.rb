require 'rails_helper'

RSpec.describe 'MagicDeck new page', type: :feature do
  before :each do
    @magic_deck_1 = MagicDeck.create!(name: "Cycle of Death", format: "Standard", minimum_card_count: 60, qualifies: true, created_at: Time.now - 3.hour)
    @magic_deck_2 = MagicDeck.create!(name: "Treasury", format: "Historic", minimum_card_count: 60, qualifies: true, created_at: Time.now - 1.hour )
    @magic_deck_3 = MagicDeck.create!(name: "Newest Vampires", format: "Commander", minimum_card_count: 100, qualifies: true, created_at: Time.now - 2.hour )
  end

  describe "As a visitor" do
    describe "When I visit the Parent Index page" do
      it "clicks the link to the new page from MagicDeck index and directs viewer to that page" do
    
        visit "/magic_decks"

        click_link('New Magic Deck')
        expect(current_path).to eq('/magic_decks/new')
      end

      it "can create a new Magic Deck" do
        visit '/magic_decks/new'

        fill_in('Name', with: 'Undead Hunger')
        fill_in('Format', with: 'Commander / EDH')
        click_button('Create Magic Deck')

        expect(current_path).to eq("/magic_decks")
        expect(page).to have_content('Undead Hunger')
        expect(page).to have_content('Commander / EDH')
      end
    end
  end
end

# [X] done

# User Story 11, Parent Creation 

# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.