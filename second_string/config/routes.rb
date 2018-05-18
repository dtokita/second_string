Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  get 'roster/index'

  get 'data_entry/index'
  get 'data_entry/create_player'
  get 'data_entry/edit_player'
  get 'data_entry/create_game'
  get 'data_entry/create_statline'
  post 'data_entry/create_player', to: 'data_entry#create_player_post'
  post 'data_entry/edit_player', to: 'data_entry#edit_player_post'
  post 'data_entry/create_game', to: 'data_entry#create_game_post'
  post 'data_entry/create_statline', to: 'data_entry#create_statline_post'

  get 'stats/index'
  get 'stats/player_stats/:player_id', to: 'stats#player_stats'
  get 'stats/player_stats'
  get 'stats/team_stats'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
