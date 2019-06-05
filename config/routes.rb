Rails.application.routes.draw do
  devise_for :users, controllers: {
      registrations: 'registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'categories#index'
  get 'welcome', to: 'pages#index'

  get 'categories', to: 'categories#index'
  get '/products/:id', to: 'products#show', as: 'product'
  #

  resources :categories, only: [:index] do
    resources :products, only: [:index]
  end
end
