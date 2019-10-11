Rails.application.routes.draw do
  resources :subscriptions, only: [:create, :destroy]
  resources :post_topics, only: [:index]
  resources :topics, only: [:index]
  resources :notes, only: [:index]
  resources :posts, only: [:index]
  resources :users, only: [:show, :create]
  
  resources :tokens, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
