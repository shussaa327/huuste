Rails.application.routes.draw do
root "homes#top"
get "about" => "homes#about"
devise_for :users
resources :shops do
  resources :posts
end
resources :users
end
