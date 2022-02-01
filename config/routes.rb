Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'products#index'
  resources :products, only: [:show, :index] do
    resources :reviews, only: [:new, :create]
  end
end
