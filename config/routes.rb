Rails.application.routes.draw do
  devise_for :users
  root 'welcome#overview'
  devise_scope :user do
    get 'login' => 'devise/sessions#new'
    get 'signup' => 'devise/registrations#new'
  end    
  
  post 'tipp_abgeben' => 'welcome#tipp_abgeben'
  get 'tipp/:id' => 'tipp#edit'
  get 'admin' => 'admin#gameresults'
  post 'goals_one/:id' => 'admin#add_goal_to_team_one', as: :goals_one
  post 'goals_two/:id' => 'admin#add_goal_to_team_two', as: :goals_two
  post 'remove_goals_one/:id' => 'admin#remove_goal_for_team_one', as: :remove_goals_one
  post 'remove_goals_two/:id' => 'admin#remove_goal_for_team_two', as: :remove_goals_two
  post 'finish/:id' => 'admin#end_game', as: :save_results
  post 'runde/:id' => 'admin#settings_update', as: :settings

  get 'groups' => 'welcome#groups'
  get 'games' => 'welcome#games'
  get 'tabelle' => 'welcome#tabelle'
  get 'how-to-play' => 'welcome#how_to_play'
  get 'impressum' => 'welcome#impressum'
  get 'datenschutz' => 'welcome#datenschutz'
  get 'richtlinien' => 'welcome#richtlinien'
  get 'willkommen' => 'welcome#index'
  get 'problem_melden' => 'welcome#problem_melden'
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