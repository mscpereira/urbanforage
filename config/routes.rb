Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :restaurants, only: %i[index show] do
    resources :reviews, only: %i[index create]
    resources :restaurant_vibes, only: %i[create destroy]
  end
  resources :collections do
    member do
      patch :favorite
    end
    resources :restaurant_collections, only: :create
  end
  resources :vibes, only: %i[index]

  get "dashboard/friendlist", to: "pages#dashboard_my_friendlist"
  patch "confirm_invitation/:id", to: "invitations#confirm", as: "confirm_invitation"
  patch "reject_invitation/:id", to: "invitations#reject", as: "reject_invitation"

end
