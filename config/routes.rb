# -*- encoding : utf-8 -*-
MasterLanguage::Application.routes.draw do

  resources :events
  match 'before_new' =>'events#before_new'
  match '/podla_lektorov' => 'events#podla_lektorov'
  match '/podla_miestnosti' => 'events#podla_miestnosti'
  match '/new_public' => 'events#new_public'
  match '/planuj_public/:zac/:dlzka' => 'events#planuj_public'
  match '/planuj_kurz' => 'events#planuj_kurz'
  match '/pridaj_terminy' => 'events#pridaj_terminy'
  match '/udalosti_pridane' => 'events#udalosti_pridane'
  match '/zvol_lektora' => 'events#zvol_lektora'
  match '/presun_event/:id' => 'events#presun_event'
  

  resources :bad_dates

  devise_for :admins

  match 'users/subjects/:id' => 'users#subjects'
  devise_for :users, :path_prefix => 'd'
  match 'users/add_subject/:id' =>'users#add_subject'
  
  
	resources :users
  
  
  #devise_for :users, :class_name => 'User', :controllers => {:registrations => "user/registrations", 
  #									:sessions => 'main' } do
  #  get   "user/sign_up" => "user/registrations#new", :as => :user_signup
  #end
  #devise_for :users, :controllers => { :registrations => 'user/registrations' }


  get "master_language/index"

	root :to => "master_language#index"

  resources :jobs
  match 'jobs/new_to_subject/:id' => 'jobs#new_to_subject'

  resources :lectors

  resources :buyers

  resources :subjects
  match 'subjects/new_job/:id' => 'subjects#new_job'


  resources :classrooms

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
  # match ':controller(/:action(/:id(.:format)))'
end
