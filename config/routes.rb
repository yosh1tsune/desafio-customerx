Rails.application.routes.draw do
  root to: 'home#index'
  
  devise_for :users

  resources :clients do
    resources :contacts, only: %i[new create]
  end

  resources :contacts, only: %i[show edit update destroy]
end
