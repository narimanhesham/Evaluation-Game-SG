Rails.application.routes.draw do
  devise_for :players
  root 'pages#home'

  get 'profile' => 'pages#profile', as: :profile

  get 'treasureHunties/:game_id' => 'pages#treasureHunties', as: :treasureHunties

  get 'collectedInventions' => 'pages#collectedInventions', as: :collectedInventions

  get 'topPlayers' => 'pages#topPlayers', as: :topPlayers

  get 'help' => 'pages#help', as: :help

  get 'home/checkpointsMap/play/:game_id/:checkpoint_id/:city_id' => 'pages#play', as: :play 

  get 'treasureHunties/arrangeInvention' => 'pages#arrangeInvention', as: :arrangeInvention

  get 'treasureHunties/arrangeInvention/information' => 'pages#information', as: :information

  get 'home/checkpointsMap/:game_id' => 'pages#checkpointsMap', as: :checkpointsMap

  post '/home/checkpointsMap' => 'pages#checkpointsMap', as: :checkpointsMapPost

  get 'home/addQuestionsHints' => 'pages#addQuestionsHints', as: :addQuestionsHints

  get 'register' => 'pages#register', as: :register

  post 'home/checkpointsMap/play:game_id/:checkpoint_id/:city_id' => 'pages#play', as: :playPost

  get 'home/checkpointsMap/play:game_id/:checkpoint_id/:city_id?:score&:correct_questions' => 'pages#play', as: :playGet

  get 'treasureHunties/:game_id/information' => 'pages#information', as: :inventionInformation

  get 'players/sign_out' => "devise/sessions#destroy"

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
