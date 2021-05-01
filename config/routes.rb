Rails.application.routes.draw do
  get 'mypage/show'
  root to: 'home#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :rankings
  resources :games
end
