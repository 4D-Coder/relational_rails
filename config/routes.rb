Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/', to: 'home#index'
  get '/magic_decks', to: 'magic_decks#index'
  get '/magic_decks/:id', to: 'magic_decks#show'
  get '/cards', to: 'cards#index'

end
