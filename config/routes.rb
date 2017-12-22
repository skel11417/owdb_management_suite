Rails.application.routes.draw do
  root 'dashboard#index'
  get '/dashboard', to: 'dashboard#index'
  resources :cities, :countries, :grantees, :host_orgs, :pods, :states, :travel_dates
end
