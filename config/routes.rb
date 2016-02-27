Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'listings#index'

  resources :users, only: [:new, :create, :update] do
    collection do
      get '/signup',    to: 'users#new'
      get '/login',     to: 'sessions#new'
      post '/login',    to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'
      get '/profile',   to: 'users#show'
    end
  end

  resources :listings, only: [:index] do
  end
end
