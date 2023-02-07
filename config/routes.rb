Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/', to: 'home#index'
  get '/magic_decks', to: 'magic_decks#index'
  get '/magic_decks/new', to: 'magic_decks#new'
  post '/magic_decks', to: 'magic_decks#create'
  get '/magic_decks/:magic_decks_id', to: 'magic_decks#show'
  patch '/magic_decks/:magic_decks_id', to: 'magic_decks#update'
  get '/magic_decks/:id/edit', to: 'magic_decks#edit'

  
  get '/magic_decks/:magic_deck_id/cards', to: 'magic_deck_cards#index'
  post '/magic_decks/:magic_deck_id/cards', to: 'magic_deck_cards#create'
  get "/magic_decks/:magic_deck_id/cards/new", to: 'magic_deck_cards#new'
  
  get '/cards', to: 'cards#index'
  get '/cards/:id', to: 'cards#show'
end
