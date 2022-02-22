Rails.application.routes.draw do
  get 'pokemons/index'
  devise_for :users
  root to: 'pages#home'
  resources :pokemons do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :show, :destroy, :update] do
    resources :reviews, only: [:create, :index, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pokemons, only: [:new, :create]
end
