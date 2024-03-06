Rails.application.routes.draw do
  root to: "pages#home"

  resources :subscriptions do
    get 'stats', on: :collection
  end

  devise_for :users



end
