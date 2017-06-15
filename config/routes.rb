Rails.application.routes.draw do
  root 'welcome#home'
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}

  resources :users, only: [:show] do
    resources :resources, only: [:index]
  end

  resources :resources

  get '/topics/:id', to: 'topics#show', as: "topic"

  resources :languages, only: [:new, :create, :show, :destroy]

  resources :courses do
    resources :resources
  end
end
