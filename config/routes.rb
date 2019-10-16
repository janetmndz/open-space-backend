Rails.application.routes.draw do
  resources :subscriptions, only: [:create, :destroy]
  resources :post_topics, only: [:index]
  resources :topics, only: [:index]
  resources :notes, only: [:create]
  resources :posts, only: [:index, :create, :update, :destroy]
  resources :users, only: [:show, :create]
  
  resources :tokens, only: [:create]

  get '/unsubscribed/:id', to: 'users#unsubscribed', as: 'unsubscribed'
  get '/postings/:id', to: 'users#postings', as: 'postings'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
