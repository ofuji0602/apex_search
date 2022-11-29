Rails.application.routes.draw do
  get 'tops/index'
  root 'pages#index'
  get 'pages/show'
  devise_for :users
  get 'rank/index', to: 'rank#index'
  get 'searches/index', to: 'searches#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
