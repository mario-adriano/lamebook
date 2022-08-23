Rails.application.routes.draw do
  devise_for :users
  get 'posts/index'
  get 'posts/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
end
