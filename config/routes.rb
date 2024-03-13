Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users

  resources :subscriptions do
    collection do
      get :stats
      get :export, to: 'subscriptions#export'
      get :export_pdf, to: 'subscriptions#export_pdf'
    end
  end

  resources :emails do
    post :send_email
  end

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  # get 'custom_email', to: 'emails#custom_email'
end
