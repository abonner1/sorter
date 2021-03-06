Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}

  resources :users, only: [:show] do
    resources :resources, shallow: true do
      resources :comments, shallow: true, only: [:new, :create, :edit, :update, :destroy]
    end
  end

  resources :languages, only: [:index, :new, :create, :show, :destroy]

  resources :tags, only: [:show, :destroy]

end
