class MagicDecksController < ApplicationController
  def index
    @magic_decks = MagicDeck.all
  end
  
  def show
    @magic_deck = MagicDeck.find(params[:id])
  end
end