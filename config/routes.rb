Rails.application.routes.draw do
  root "posts#index"

  get "/users/:id/edit/password", to: 'users#password', as: 'password'

  resources :users, only: [:new, :create, :edit, :update]
  resource :session, only: [:new, :create, :destroy]

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
end
