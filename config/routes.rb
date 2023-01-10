Rails.application.routes.draw do
  root 'pages#index'
  get 'ranks', to: 'ranks#index'
  get 'keywords', to: 'keywords#index'
  get 'pages/show'
  get 'tops/index'
  devise_for :users
  post 'searches', to: 'searches#index'
  post 'keywords', to: 'keywords#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
