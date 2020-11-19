# frozen_string_literal: true

Rails.application.routes.draw do
  get 'myinterested/show'
  get 'myparties/show'
  get 'users/index'
  Rails.application.routes.draw do
  get 'myinterested/show'
  get 'myparties/show'
  get 'users/index'
    devise_for :users, controllers: {
      sessions: 'users/sessions', registrations: 'users/registrations'
    }
        
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :only =>[:show]
  root to: 'static_pages#home'
  get 'static_pages/home'
  resources :comunas
  match '/users',   to: 'users#index',   via: 'get'
  match '/users/:id',     to: 'users#show',       via: 'get'
  get '/myparties/show' => 'myparties#show', as: :mypartiesshow
  get '/myinterested/show' => 'myinterested#show', as: :myinterestedshow
  resources :services do
    resources :servicereviews
    resources :contracts
  end

  # resources :parties do
  #   resources :partyreviews
  #   resources :interesteds

  # end

  resources :parties do
    resources :partyreviews
    resources :interesteds
    resources :services do
      resources :servicereviews
    end
  end

  resources :attendees
  resources :interesteds
end
