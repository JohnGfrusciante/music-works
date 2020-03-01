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

    resources :users do
      resources :offers, only: [:index, :create, :destroy]
      resources :offered_lists, only: [:index] do
        put 'already_confirmed', to: 'offered_lists#already_confirmed'
        put 'unconfirm', to: 'offered_lists#unconfirm'
      end
    end

    resources :mypages, except: [:destroy]
    resources :applications_lists, only: [:index]
    resources :likes, only: [:index]
    resources :user_chatslists, only: [:index]
    resources :musician_chatslists, only: [:index]

    resources :musicians, except: [:destroy] do
      resources :musician_matterslists, only: [:index]
      resources :tags, only: [:index] do
        collection do
          get 'user_search'
        end
      end
    end


    resources :matters, only: [:new, :create, :show, :edit, :update] do
      resources :likes, only: [:create, :destroy]
      resources :applications, only: [:create, :destroy] do
        resources :applied_users, only: [:index]
      end
      resources :chats, only: [:create] do
        resources :messages, except: [:show] do
          put 'already_read', to: 'messages#already_read'
          put 'unread', to: 'messages#unread'
        end
        resources :reply_messages, except: [:show] do
          put 'already_read', to: 'reply_messages#already_read'
          put 'unread', to: 'reply_messages#unread'
        end
      end
      collection do
        get 'search'
        get 'category_search'
      end
    end



end
