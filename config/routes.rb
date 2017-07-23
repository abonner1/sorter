Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}

  resources :users, only: [:show] do
    resources :resources, only: [:index]
  end

  resources :resources

  get '/topics/:id', to: 'topics#show', as: "topic"

  resources :languages, only: [:index, :new, :create, :show, :destroy]

  resources :courses do
    resources :resources, only: [:new]
  end

  resources :comments, only: [:new, :create, :edit, :update]

end
