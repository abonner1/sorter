Rails.application.routes.draw do
  root 'welcome#home'
  devise_for :users

  resources :users, only: [:show] do
    resources :resources, only: [:index]
  end

  resources :resources
end
