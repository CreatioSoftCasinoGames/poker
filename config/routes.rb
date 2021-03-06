require 'sidekiq/web'
Rails.application.routes.draw do

  resources :games

  resources :reward_and_levels

  resources :tournament_configs

  resources :in_game_gifts

  resources :login_histories

  resources :economy_ranges

  resources :economy_bets

  resources :economy_hands

  resources :economy_participations

  mount Sidekiq::Web => '/sidekiq'
  resources :tables

  resources :table_configs

  resources :rooms

  devise_for :users
  get "utility/show_api_key", to: "utility#show_api_key", as: "show_api_key"
  post "utility/generate_api_key", to: "utility#generate_api_key", as: "generate_api_key"
  
  resources :utility do
    collection do
      get :sync_data
    end
  end


  namespace :api do
    namespace :v1 do
      resources :table_configs
      resources :users
      resources :games
      resources :friend_requests
      resources :gift_requests
      resources :tables do
        get :assign, on: :collection
      end
      resources :users do
        member do
          get :friend_request_sent
          get :my_friend_requests
          get :my_friends
          delete :delete_friend
          get :send_in_game_gift
          get :gift_sent
          get :gift_received
          get :asked_for_gift_to
          get :asked_for_gift_by
        end
      end
      resources :sessions, only: [:create, :destroy]
      resources :sessions do
        member do
          put :connect_facebook
        end
      end
      resources :table_config_users, only: [:create]
      get "table_configs/:game_type/tables" => "table_configs#get_game_type"
      resources :tournament_configs do
        member do
          get :leader_board
        end
      end
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
