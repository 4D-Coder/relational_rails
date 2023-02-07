class MagicDeckCardsController < ApplicationController
  def index
    @magic_deck = MagicDeck.find(params[:magic_deck_id])
    @cards = @magic_deck.cards
  end
  
  def show
    @card_count = MagicDeck.cards.count
  end

  def new
    @magic_deck = MagicDeck.find(params[:magic_deck_id])
  end
  
  def create
    magic_deck = MagicDeck.find(params[:magic_deck_id])
    created_card = magic_deck.cards.create!(magic_decks_cards_params)

    redirect_to "/magic_decks/#{magic_deck.id}/cards"
  end

  private

  def magic_decks_cards_params
    params.permit(
      :name,
      :mana_cost,
      :card_type,
      :archtype,
      :rarity,
      :power_toughness,
      :expansion,
      :legal
    )
  end
end