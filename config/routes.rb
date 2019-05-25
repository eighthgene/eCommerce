Rails.application.routes.draw do
  devise_for :users, controllers: {
      registrations: 'registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get 'welcome', to: 'pages#index'
  get 'products', to: 'products#index'
end
