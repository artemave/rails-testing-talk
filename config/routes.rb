Rails.application.routes.draw do
  resources :posts do
    resources :comments, only: [:new, :create]
  end
  resources :comments, only: [] do
    resources :comments, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
end
