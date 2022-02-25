Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get "my_albums", to: "albums#my_albums", as: :my_albums

  resources :albums, only: [:index, :show, :edit, :update, :new, :create, :destroy, :my_albums] do
    resources :musics, only: [:index, :new, :create]
    resources :sales, only: [:create]
    resources :reviews, only: [:create]
  end

  resources :reviews, only: [:destroy]
  resources :musics, only: [:destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
