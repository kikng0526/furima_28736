Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :products do
    resources :managements
    resources :address
  end
end
