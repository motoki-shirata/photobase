Rails.application.routes.draw do
  # get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index'
  get 'pages/index' => 'pages#index'
  devise_scope :user do
     get  '/users/sign_out' => 'devise/sessions#destroy'
  end
  # ここから
  
  # ここまで追加
  
  resources :posts, only: %i(new create index) do
    resources :like, only: %i(create destroy)
    resources :photos, only: %i(create)
    resources :comments, only: %i(create destroy)
  end
  get '/users/:id', to: 'users#show', as: 'user'
end
