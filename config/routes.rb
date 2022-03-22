Rails.application.routes.draw do
  # Uncomment if the database has been dropped and needs data again
  post 'pokemons/action/load', to: 'pokemons#load_csv'
  resources :pokemons
  get 'pokemons/visual/table/:page', to: 'pokemons#table'
end
