Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
    }

    devise_scope :user do
      get 'performance', to: 'users/registrations#performance'
      post 'performance', to: 'users/registrations#performance'
      get 'done', to: 'users/registrations#done'
      post 'done', to: 'users/registrations#done'
      get 'logout', to: "users#logout"
    end
    root to: "matters#index"

    resources :musicians, except: [:destroy] do
      # resources :matters, except: [:new, :create, :destroy]
    end

    resources :matters, only: [:new, :create, :show]

end
