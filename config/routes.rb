Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :restaurants, only: %i[index show] do
    resources :reviews, only: %i[create]
    resources :restaurant_vibes, only: %i[create destroy]
  end
  resources :collections do
    resources :restaurant_collections, only: %i[create destroy]
  end
  resources :vibes, only: %i[index]
end
