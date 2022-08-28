Rails.application.routes.draw do
  root "posts#index"

  devise_for :users

  get 'posts/index'
  get 'posts/new'
  
  resources :likes, only: %i[create destroy]
end
