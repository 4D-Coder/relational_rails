require 'rails_helper'

RSpec.describe 'MagicDeck index page', type: :feature do
  before :each do
    @magic_deck_1 = MagicDeck.create!(name: "Cycle of Death", format: "Standard", minimum_card_count: 60, qualifies: true, created_at: Time.now - 3.hour)
    @magic_deck_2 = MagicDeck.create!(name: "Treasury", format: "Historic", minimum_card_count: 60, qualifies: true, created_at: Time.now - 1.hour )
    @magic_deck_3 = MagicDeck.create!(name: "Newest Vampires", format: "Commander", minimum_card_count: 100, qualifies: true, created_at: Time.now - 2.hour )
  end

  describe "As a visitor" do
    context "When I visit '/parents'" do
      it "can see the name of each parent record in the system for each parent table" do
    
        visit "/magic_decks"
        
        expect(page).to have_content(@magic_deck_1.name)
        expect(page).to have_content(@magic_deck_2.name)
        expect(page).to have_content(@magic_deck_3.name)
      end
    end

    context 'When I visit the parent index' do
      it 'can see that records are ordered by most recently created first' do

        visit "/magic_decks"

        expect(page).to have_content("#{@magic_deck_2.name}")
        expect(page).to have_content("#{@magic_deck_3.name}")
        expect(page).to have_content("#{@magic_deck_1.name}")
      end
      
      it 'can see when it was created next to each of the records' do
        
        visit '/magic_decks'
  
        expect(page).to have_content("#{@magic_deck_2.name}, created at: #{@magic_deck_2.created_at}")
        expect(page).to have_content("#{@magic_deck_3.name}, created at: #{@magic_deck_3.created_at}")
        expect(page).to have_content("#{@magic_deck_1.name}, created at: #{@magic_deck_1.created_at}")
        
      end
    end

    context 'When I visit any page on the site' do
      it 'can see a link at the top of the page that takes me to the Child Index' do
        visit '/magic_decks'
        save_and_open_page

        click_link('Cards Index')
        expect(current_path).to eq('/cards')
      end
    end
  end
end

# [X] done

# User Story 1, Parent Index 

# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

# [X] done

# User Story 6, Parent Index sorted by Most Recently Created 

# As a visitor
# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created

# [ ] done

# User Story 8, Child Index Link

# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Child Index


