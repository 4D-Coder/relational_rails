require 'rails_helper'

RSpec.describe 'MagicDeck show page' do
  describe "As a visitor" do

    before do
      @magic_deck_1 = MagicDeck.create!(name: "Cycle of Death", format: "Standard", minimum_card_count: 60, qualifies: true)
      @magic_deck_4 = MagicDeck.create!(name: "UnDeAD HUnGEr", format: "Comeander", minimum_card_count: 100, qualifies: true, created_at: Time.now - 2.hour )

      
      @card_1 = Card.create!(name: "Henrika Domnathi", mana_cost: 4, card_type: "Legendary Creature", archtype: "Vampire", rarity: "MR", power_toughness: "1/3", expansion: "VOW", legal: true, magic_deck_id: @magic_deck_1.id)
      @card_2 = Card.create!(name: "Necroduality", mana_cost: 4, card_type: "Enchantment", rarity: "MR", expansion: "VOW", legal: true, magic_deck_id: @magic_deck_1.id)
    end
  
    context "When I visit a parent's show page" do
      it "can see the parent with that id including the parent's attributes" do
      
        visit "/magic_decks/#{@magic_deck_1.id}"
     
        expect(page).to have_content(@magic_deck_1.name)
        expect(page).to have_content("Minimum Card Count: #{@magic_deck_1.minimum_card_count}")
        expect(page).to have_content("Format: #{@magic_deck_1.format}")
        expect(page).to have_content("Legal? - #{@magic_deck_1.qualifies}")
      end
    

      it "I see a count of the number of children associated with this parent" do
      
        visit "/magic_decks/#{@magic_deck_1.id}"
        
        expect(page).to have_content("This deck has: #{@magic_deck_1.cards.count} cards")
      end

      it "clicks the link to the update page from MagicDeck show and directs viewer to that page" do
    
        visit "/magic_decks/#{@magic_deck_4.id}"

        click_link("Update #{@magic_deck_4.name}")

        expect(current_path).to eq("/magic_decks/#{@magic_deck_4.id}/edit")
      end
    end
  end
end

# [X] done

# User Story 2, Parent Show 

# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes
# (data from each column that is on the parent table)

# [X] done

# User Story 12, Parent Update 

# As a visitor
#  - magic_decks/show_spec.rb -
# [When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:]
#  - magic_decks/edit_spec.rb -
# [Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info]
