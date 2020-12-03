Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root "homes#top"
get "/about" => "homes#about"

namespace :public do
	resources :customers, only: [:show, :update, :edit]
	resources :cart_items, only: [:index, :create, :update, :destroy]
	resources :items, only: [:index, :show]
	resources :orders, only: [:new, :create, :index, :show]
	resources :shipppings
end

namespace :admin do
	resources :customers, only: [:index, :show, :edit, :update]
	resources :genres, only: [:index, :create, :edit, :update]
	resources :items
	resources :orders
end
end
