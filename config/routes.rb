Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :rankings
  resources :games do
    resources :reviews, only: %i[create destroy]
  end

  namespace :api do 
    get '/tmdb', to: 'tmdb#index'
  end

  resource :mypage, only: %i[show]
end
