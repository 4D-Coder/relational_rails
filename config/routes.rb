Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/magic_decks', to: 'home#index'
  get '/magic_decks/deck', to: 'magic_deck#index'
  get '/magic_decks/deck/cards', to: 'cards#index'

end
