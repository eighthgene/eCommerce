Rails.application.routes.draw do
  devise_for :users, controllers: {
      registrations: 'registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'categories#index'
  get 'welcome', to: 'pages#index'

  get 'categories', to: 'categories#index'
  get '/products/:id', to: 'products#show', as: 'product'
  get '/products', to: 'products#index', as: 'products'

  # Terms of use and privacy policy
  get '/terms_of_use', to: 'legal_aspects#terms_of_use', as: 'terms'
  get '/privacy_policy', to: 'legal_aspects#privacy_policy', as: 'privacy'


  # Cart and order
  resources :order_items
  resource :carts, only: [:show]

  # Payment by PayPal
  post '/createpayment', to: 'carts#createpayment'
  post '/executepayment', to: 'carts#executepayment'

  resources :categories, only: [:index] do
    resources :products, only: [:index]
  end
end
