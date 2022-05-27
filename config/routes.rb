Rails.application.routes.draw do

# Defines the root path route ("/")
  root "articles#index"

# Defines other paths
  # get "/articles", to: "articles#index"
  # get "articles/:id", to: "articles#show"

  # above is replaced by below

  resources :articles do
    resources :comments
  end
end
