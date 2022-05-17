Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :rentals, only: [:index]
  resources :shoes do
    resources :rentals, only: [ :new, :create ]
  end

  namespace :owner do
    resources :rentals, only: :index
  end
end
