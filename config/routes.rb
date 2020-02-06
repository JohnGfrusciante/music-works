Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
    }

    devise_scope :user do
      get 'basic', to: 'users/registrations#basic'
      post 'basic', to: 'users/registrations#basic'
      get 'performance', to: 'users/registrations#performance'
      post 'performance', to: 'users/registrations#performance'
      get 'logout', to: "users#logout"
    end
    root to: "matters#index"

    resources :matters

end
