Rails.application.routes.draw do
  get 'rankings/index'
  get 'rankings/show'
  get 'rankings/new'
  get 'rankings/edit'
  get 'mypage/show'
  root to: 'home#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :games
end
