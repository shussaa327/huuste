Rails.application.routes.draw do

root "homes#top"
get "about" => "homes#about"
resources :shops
resources :posts
resources :users

end
