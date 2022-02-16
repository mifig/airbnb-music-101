Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :albums, only: [:show, :new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
