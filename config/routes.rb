Rails.application.routes.draw do
  root "posts#index"
  
  devise_for :users, skip: [:registrations]
  as :user do
    get "/sign_in" => "devise/sessions#new"
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration"
    post "/sign_up" => "devise/registrations#create", as: "user_registration"
  end

  get 'posts/index'
  get 'posts/new'
  post 'posts/create'
  get 'posts/user_posts'

  resources :likes, only: %i[create destroy]
end
