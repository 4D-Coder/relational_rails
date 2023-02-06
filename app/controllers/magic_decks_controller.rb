class MagicDecksController < ApplicationController
  def index
    @magic_decks = MagicDeck.desc_ordered
    
  end
  
  def show
    @magic_deck = MagicDeck.find(params[:magic_decks_id])
    @card_count = @magic_deck.cards.count
  end

  def new

  end

  def create
    magic_deck = MagicDeck.create(magic_deck_params)
    redirect_to "/magic_decks"
  end

  def edit

  end

  def magic_deck_params
    params.permit(
      :name,
      :format
    )
  end
end