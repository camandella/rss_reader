Rails.application.routes.draw do
  root 'feeds#index'
  resources :feeds
  resources :posts, only: [:index]
end
