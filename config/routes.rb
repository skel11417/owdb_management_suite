Rails.application.routes.draw do
  root 'dashboard#index'
  get '/dashboard', to: 'dashboard#index'
  get '/statistics', to: 'statistics#index'
  get '/statistics/states', to: 'statistics#states'
  get '/statistics/grantees', to: 'statistics#grantees'
  resources :cities, :countries, :grantees, :host_orgs, :pods, :states, :travel_dates
end
