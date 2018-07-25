Rails.application.routes.draw do
  scope format: false do
    resources :tasks
    devise_for :users
  end
  root to: 'tasks#index'
end
