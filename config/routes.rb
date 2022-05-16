Rails.application.routes.draw do
  root 'articles#index'
  resources :comments
  devise_for :users
  resources :articles
  get '/comments/tree_comments/:id', to: 'comments#show_tree'
  get '/comments/reply_on_tree/:id', to: 'comments#reply_on_tree'
  get '/tag_search/:tag', to: 'articles#tag_search'
end
