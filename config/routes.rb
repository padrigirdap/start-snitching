Rails.application.routes.draw do
  devise_for :users
  root "pollution_events#index"

  resources :pollution_events do
    resources :comments, only: [:new, :create, :update, :edit, :destroy]
  end

  namespace :api do
    resources :pollution_events, only: [:index]
  end
end
