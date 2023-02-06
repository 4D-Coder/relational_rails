Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/', to: 'home#index'
  get '/magic_decks', to: 'magic_decks#index'
  get '/cards', to: 'cards#index'
  get '/magic_decks/new', to: 'magic_decks#new'
  get '/cards/:id', to: 'cards#show'
  get '/magic_decks/:magic_deck_id/cards', to: 'magic_deck_cards#index'
  get '/magic_decks/:magic_decks_id', to: 'magic_decks#show'
  post '/magic_decks', to: 'magic_decks#create'
end
