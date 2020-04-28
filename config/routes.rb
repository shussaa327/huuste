Rails.application.routes.draw do
root "homes#top"
get "about" => "homes#about"
post "follow/:id" => "relationships#follow", as: "follow"
post "unfollow/:id" => "relationships#unfollow", as: "unfollow"
post "users/guest_sign_in" => "users#new_guest"
devise_for :users
resources :shops, only: [:index, :new, :create, :show] do
  resource :shop_recommendations, only: [:create, :destroy, :index]
end
resources :posts do
  resource :favorites, only: [:create, :destroy]
  resources :post_comments, only: [:create, :destroy]
end
resources :users
resources :areas, only: [:show]
end
