class MagicDecksController < ApplicationController
  def index
    @magic_decks = MagicDeck.desc_order
    
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
    @magic_deck = MagicDeck.find(params[:id])
  end

  def update
    magic_deck = MagicDeck.find(params[:magic_decks_id])
    magic_deck.update!(magic_deck_params)
    
    redirect_to "/magic_decks/#{magic_deck.id}"
  end

  private

  def magic_deck_params

    params.permit(
      :name,
      :format
    )
  end
end