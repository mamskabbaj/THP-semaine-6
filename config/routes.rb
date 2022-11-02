Rails.application.routes.draw do

  get '/static_pages/team', to: 'static_pages#team'
  get '/static_pages/contact', to: 'static_pages#contact', as: 'test'
 
  resources :gossips
  root to: 'gossips#index'
end

