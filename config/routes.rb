HarvestProfit::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

devise_for :users, controllers: {sessions: "sessions",registrations: "registrations" ,passwords: "passwords"}




  get "home/index"
  resources :home do
    collection do
      get 'add_consultant'
      post 'consultant_create'
      get 'add_user'
      post 'user_create'
      get "recommend"
      post "recommend"
      post 'recommed_create'
      post 'recommend_search'
      get 'consultant_user_list'
      get 'user_recommend'
      get 'create_crop_information'
      post 'crop_information'
      get 'users_list'
      get 'users_crop_sales'
      post 'create_crop_sale'
      post 'hedge_sale'
      post 'hedge_sale_create'
     
      get 'sign_in'
      get 'sale'
      get 'crop'
      get 'add_archive'
      get 'remove_archive'
      get 'new_year'
      post 'year_create'
      post 'add_archive'
      post 'archive_select'
      post 'update_crop_information'
      get 'crop_expense'
      post 'hedge_sale_crop'
    end
    member do 
    put 'update_label'
    get 'remove_crop'
     get 'user_destroy'
    end
  end
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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
