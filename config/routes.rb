Rails.application.routes.draw do
  
  get 'reports/sync', to: 'reports#sync'
  resources :reports
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
