Rails.application.routes.draw do
  root 'dashboard#index'
  get '/dashboard', to: 'dashboard#index'
  get '/checklist', to: 'checklist#index'
  patch '/dashboard/tasks/:id', to: 'dashboard#update_task'
  patch '/tasks/:id', to: 'tasks#change_status'
  get '/statistics', to: 'statistics#index'
  get '/statistics/states', to: 'statistics#states'
  get '/statistics/grantees', to: 'statistics#grantees'
  resources :cities, :countries, :grantees, :host_orgs, :pods, :states, :task_types, :tasks, :travel_dates
end
