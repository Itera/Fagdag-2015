Rails.application.routes.draw do
  resources :products do
    member do
      post "add_to_cart"
      post "decrease_from_cart"
      post "remove_from_cart"
    end
  end

  root "products#index"
end
