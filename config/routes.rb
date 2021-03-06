Testapp::Application.routes.draw do
  #get "comments/index"
  #get "comments/show"
  #get "comments/edit"
  #get "comments/destroy"
  #get "comments/new"
  get "download/file" #all types

  resources :comments

  #get "sm_contents/index"
  #get "sm_contents/show"
  #get "sm_contents/create"
  #get "sm_contents/destroy"
  #get "sm_contents/edit"
  #get "submenus/create"
  #get "submenus/destroy"
  #get "submenus/edit"
  #get "submenus/transfer"

  resources :users do
	  #resources :settings
	  match "/settings", to: "user_settings#index", via: :get
  end
  match '/signup', to: 'users#new', via: :get

  resources :sessions, only: [:new, :create, :destroy]
  match "/signin", to: "sessions#new", via: :get
  match "/signout", to: "sessions#destroy", via: :delete

	resources :genmenus
	match "/genmenus/:id" => "genmenus#submenuadd", via: :post

	resources :submenus

	resources :sm_contents do
		resources :assets
		#match '/assets/deleteassets' => 'assets#deleteassets', :as => 'delete_assets', via: :delete
		match '/assets/edit' => 'assets#edit', :as => 'edit_assets', via: :get
		match '/assets/edit' => 'assets#destroy', via: :post


		#match '/assets/addassets' => 'assets#addassets', :as => 'add_assets', via: :get
		####match '/assets/addassets' => 'assets#create', :as => 'create_assets', via: :post
		#match '/assets/new' => 'assets#new', :as => 'new_assets', via: :get
		#match '/assets/new' => 'assets#create', :as => 'assets', via: :post
	end

  #match '/assets/deleteassets' => 'assets#deleteassets', :as => 'delete_assets', via: :delete
  #match '/assets/edit/:id' => 'assets#edit', :as => 'edit_assets', via: :get
	#match '/assets/new' => 'assets#create', :as => 'assets', via: :post


	#match "/submenus/show/:id" => "submenus#show", via: :get
	match 'sm_contents/create' => 'sm_contents#create', via: :post


	#match "/sm_contents/new/:id" => "sm_contents#new", via: :get
	#match "/sm_contents/new?sm_content[submenu_id]:id" => "smc#new", via: :get
	#http://localhost:3000/sm_contents/new?sm_contentsubmenu_id=2

	#resources :testoptions
	#resources :attaches

	#end



  #get "genmenus/index"
  #get "genmenus/create"
  #get "genmenus/destroy"
  #get "genmenus/edit"
  #get "genmenus/add"
  #get "generalpages/index"
	root  'static_pages#home'
	#match '/signup',  to: 'users#new',            via: 'get'
  #match '/home',    to: 'static_pages#home',    via: 'get'

	match '/help',    to: 'static_pages#help',    via: 'get'
	match '/about',   to: 'static_pages#about',   via: 'get'
	match '/contact', to: 'static_pages#contact', via: 'get'
	match '/admintools', to: 'static_pages#cnm',  via: 'get'

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
