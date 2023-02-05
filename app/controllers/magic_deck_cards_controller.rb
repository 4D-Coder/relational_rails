class MagicDeckCardsController < ApplicationController
  def index
    @magic_deck = MagicDeck.find(params[:magic_deck_id])
    @cards = @magic_deck.cards
  end
end