Rails.application.routes.draw do
  devise_for :users
  root "pollution_events#index"

  resources :pollution_events
end
