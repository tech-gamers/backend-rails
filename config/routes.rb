Rails.application.routes.draw do
  root to: 'pages#home'

  as :user do
    get 'sign_in', to: 'sessions#new', as: :new_session
  end
  get 'sign_up', to: 'pages#sign_up'

  devise_for :users,
             controllers: {
               omniauth_callbacks: 'callbacks/omniauth', sessions: 'sessions'
             }

  resources :users
end
