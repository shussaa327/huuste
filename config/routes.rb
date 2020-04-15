Rails.application.routes.draw do
root "homes#top"
get "about" => "homes#about"
post 'homes/guest_sign_in' => 'application#new_guest'
post "follow/:id" => "relationships#follow", as: "follow"
post "unfollow/:id" => "relationships#unfollow", as: "unfollow"

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
