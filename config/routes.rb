Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
    }

    devise_scope :user do
      get 'performance', to: 'users/registrations#performance'
      post 'performance', to: 'users/registrations#performance'
      get 'done', to: 'users/registrations#done'
      post 'done', to: 'users/registrations#done'
      get 'edit_user', to: 'users/registrations#edit_user'
      post 'edit_user', to: 'users/registrations#edit_user'
      get 'update_user', to: 'users/registrations#update_user'
      put 'update_user', to: 'users/registrations#update_user'
      get 'logout', to: "users#logout"
    end
    root to: "matters#index"


    resources :mypages, except: [:destroy]
    resources :applications_lists, only: [:index]
    resources :user_chatslists, only: [:index]
    resources :musician_chatslists, only: [:index]

    resources :musicians, except: [:destroy] do
      resources :musician_matterslists, only: [:index]
    end

    resources :matters, only: [:new, :create, :show, :edit, :update] do
      resources :applications, only: [:create, :destroy] do
        resources :applied_users, only: [:index]
      end
      resources :chats, only: [:create] do
        resources :messages, except: [:show]
        resources :reply_messages, except: [:show]
      end
    end

end
