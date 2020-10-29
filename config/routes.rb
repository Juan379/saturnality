# frozen_string_literal: true

Rails.application.routes.draw do
  Rails.application.routes.draw do
    devise_for :users, controllers: {
      sessions: 'users/sessions', registrations: 'users/registrations'
    }
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#home'
  get 'static_pages/home'
  resources :comunas
  resources :services do
    resources :servicereviews
  end
  resources :parties do
    resources :partyreviews
  end
  resources :parties do
    resources :interesteds
  end

  resources :attendees
end
