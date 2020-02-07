Rails.application.routes.draw do
root "homes#top"
get "about" => "homes#about"
devise_for :users
resources :shops
resources :posts
resources :users
end
