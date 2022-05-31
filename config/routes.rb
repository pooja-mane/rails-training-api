Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :products

      resources :users do
        resources :posts
      end
    end

    namespace :v2 do
      resources :products
      resources :users
    end
  end

  api_version(module: "V1", header: {name: "Accept", value: "application/rails-training.in; version=1"}) do
    resources :users
  end

  # resources :users
  # resources :products
end
