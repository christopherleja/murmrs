Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'murmrs#index'

  get '/users/:id/following', to: 'users#following', as: 'following'
  get '/users/:id/followers', to: 'users#followers', as: 'followers'
  
  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"

  get '/users/:id/likes', to: 'users#likes', as: 'likes'
  get '/users/:id/discover', to: 'users#discover', as: 'discover'
  
  get '/posts/:id/likes', to: 'posts#post_likes', as: 'post_likes'
  post '/posts/:id/likes', to: 'posts#post_likes', as: 'like_post'

  get '/posts/:id/comments', to: 'posts#post_comments', as: 'post_comments'
  post '/posts/:id/comments', to: 'posts#post_comments', as: 'comment_post'  
  
  resources :users
  resources :posts

  resources :posts do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
    resources :likes, only: [:new, :create, :destroy]
  end

  resources :murmrs, only: [:index]

  resources :login, only: [:new, :create]
  post "/logout", to: "login#destroy", as: "log_out"
 
end
