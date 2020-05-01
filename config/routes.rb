Rails.application.routes.draw do
  
  get 'reports/sync', to: 'reports#sync'
  resources :reports
  
  root to: 'reports#index'
end
