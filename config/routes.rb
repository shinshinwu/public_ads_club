Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'listings#index'

  resources :users, only: [:new, :create] do
    collection do
      get '/signup',    to: 'users#new'
      get '/login',     to: 'sessions#new'
      post '/login',    to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'
      get '/profile',   to: 'users#show'
      get '/edit',      to: 'users#edit'
      put '/edit',      to: 'users#update'
    end
  end

  resources :listings do
    member do
      get 'messages',   to: 'listings#messages'
    end
  end

  resources :messages, only: [:create] do
  end
end
