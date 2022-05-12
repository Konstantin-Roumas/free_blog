Rails.application.routes.draw do
  root "articles#index"
  resources :comments
  devise_for :users
  resources :articles
  get "/comments/tree_comments/:id", to: "comments#show_tree"
  get "/comments/reply_on_tree/:id", to: "comments#reply_on_tree"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
 # root "articles#index"
end
