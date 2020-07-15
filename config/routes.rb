Rails.application.routes.draw do
  root to: 'pages#home'

  get 'sign_in', to: 'users/sessions#new', as: :new_session
  get 'sign_up', to: 'pages#sign_up'

  devise_for :users, controllers: { omniauth_callbacks: 'callbacks/omniauth' }

  resources :users
end
