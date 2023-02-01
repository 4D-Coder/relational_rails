class MagicDecksController < ApplicationController
  def index
    @magic_decks = MagicDeck.all
  end
end