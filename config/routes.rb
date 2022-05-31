Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  
  post "/graphql", to: "graphql#execute"

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
