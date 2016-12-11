Rails.application.routes.draw do

  root to: 'application#home'

  post 'circumference_measurements', to: 'circumference_measurements#calculate'
  post 'skin_fold_measurements', to: 'skin_fold_measurement#calculate'

  resources :users

  resources :appointments, only: [:new, :destroy, :create, :edit, :update, :show]

  resources :anthropometric_evaluations

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
