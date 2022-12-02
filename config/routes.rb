Rails.application.routes.draw do
  root 'pages#index'
  get 'ranks/index', to: 'ranks#index'
  get 'pages/show'
  get 'tops/index'
  devise_for :users
  get 'searches/rank', to: 'searches#rank'
  get 'searches/index', to: 'searches#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
