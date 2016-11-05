Rails.application.routes.draw do
  resources :carts do
    member do
      post "add_to"
      post "decrease_from"
      post "remove_from"
    end
  end

  resources :products
  resources :orders

  root "products#index"

  get "users"    => "users#index"
end
