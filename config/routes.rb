Rails.application.routes.draw do
  # Health check endpoint para Render
  get "/health", to: proc { [200, {}, ["OK"]] }

  # Webhooks para GitHub Actions
  post "/webhooks/daily_notifications", to: "webhooks#daily_notifications"

  root to: "pages#home"
  get "/profile", to: "pages#profile", as: :profile

  post "/pages/notification_helper", to: "pages#notification_helper", as: :notification_helper_pages

  resources :subscriptions do
    collection do
      get :export, to: 'subscriptions#export'
      get :export_pdf, to: 'subscriptions#export_pdf'
    end
  end

  devise_for :users, controllers: {
      sessions: 'users/sessions'
    }

  resources :emails do
    post :send_email
  end

  # get 'custom_email', to: 'emails#custom_email'
end
