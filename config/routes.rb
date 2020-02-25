Rails.application.routes.draw do
root "homes#top"
get "about" => "homes#about"
post "follow/:id" => "relationships#follow", as: "follow"
post "unfollow/:id" => "relationships#unfollow", as: "unfollow"
get "following/:id" => "users#following"
get "follower/:id" => "users#follower"
get "/map_request" => "shops#map", as: "map_request"
devise_for :users
resources :shops
resources :posts
resources :users
end
