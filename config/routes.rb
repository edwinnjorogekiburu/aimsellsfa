Aimsellsfa::Application.routes.draw do
  
  resources :handsets
  resources :stock_issues
  resources :routes do
      member do
          get :assign
      end
  end
  resources :dsa_routes
  resources :location_types
  resources :locations
  resources :agents
  resources :agent_types
  resources :item_categories
  resources :items
  resources :users
  resources :employees
  resources :sessions, only: [:new, :create, :destroy]
  resources :employee_sessions, only: [:new, :create, :destroy]
  resources :employee_types

  match '/administrator/signin',  to: 'sessions#new'
  match '/signin',  to: 'employee_sessions#new'

  root to: 'static_pages#home'

  match '/signup', to: 'users#new'

  match "/create_employee", to: "employees#new" 

  match '/signout', to: 'sessions#destroy', via: :delete

  match '/employee_signout', to: 'employee_sessions#destroy', via: :delete
  
  match '/home', to: 'static_pages#home'
  match '/about', to: 'static_pages#about'
  match '/contactus', to: 'static_pages#contactus'
  match '/location', to: 'static_pages#location'

  match '/employee/index', to: 'static_pages#employee_main_menu'
  match '/administrator/index', to: 'static_pages#administrator_main_menu'


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
