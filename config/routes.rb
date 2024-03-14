Rails.application.routes.draw do
  root to: "pages#home"
  get "/profile", to: "pages#profile", as: :profile
  devise_for :users

  resources :pages do
    post :notification_helper, on: :collection # Ruta para ejecutar la tarea
  end

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
