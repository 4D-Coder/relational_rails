class MagicDeckCardsController < ApplicationController
  def index
    @magic_deck = MagicDeck.find(params[:magic_deck_id])
    @cards = @magic_deck.cards
  end
  
  def show
    @card_count = MagicDeck.cards.count
  end

  def new
    
  end

  private

  def magic_decks_cards_params
    params.permit(
      :magic_deck_id
    )
  end
end