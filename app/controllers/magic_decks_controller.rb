class MagicDecksController < ApplicationController
  def index
    @magic_decks = MagicDeck.desc_ordered
    
  end
  
  def show
    @magic_deck = MagicDeck.find(params[:magic_decks_id])
    @card_count = @magic_deck.cards.count
  end
end