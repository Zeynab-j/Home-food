Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resources :blogs
  resources :posts do
    resources :comments, only: [:new, :create, :index]
  end
  resources :users
  resources :registrations, only: [:new, :create, :index]
  resource :logins, only: [:new, :create, :destroy]

#  get '/blogs',  to: "blogs#index"

root "posts#index"

end
