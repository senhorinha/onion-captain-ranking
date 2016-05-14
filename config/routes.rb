Rails.application.routes.draw do
  root 'matchs#index'
  resources :matchs, only: [:create]
end
