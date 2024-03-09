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

end
