Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  root to: 'application#home'

  post 'circumference_measurements', to: 'circumference_measurements#calculate'
  post 'skin_fold_measurements', to: 'skin_fold_measurement#calculate'

  namespace :admin do
    resources :users
    resources :appointments, only: [:new, :destroy, :create, :edit, :update, :show]
    resources :anthropometric_evaluations
    resources :users do
      resources :appointments, only: [:index, :show]
    end
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
