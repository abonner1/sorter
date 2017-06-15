Rails.application.routes.draw do
  root 'resources#index'
  devise_for :users
end
