Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  get 'welcome', to: 'pages#home'
  get 'products', to: 'products#index'
end
