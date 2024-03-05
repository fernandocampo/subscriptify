Rails.application.routes.draw do
  root to: "pages#home"

  resources :subscriptions

  devise_for :users
end
