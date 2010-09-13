ActionController::Routing::Routes.draw do |map|
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  #map.resources :users

map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate', :activation_code => nil

  map.resource :session

  map.join_group '/join_group/:group_id', :controller => 'group_memberships', :action => 'create'

  map.add_question '/add_question/:id', :controller => 'questions', :action => 'new'
  
  map.take_quiz '/take_quiz/:id', :controller => 'quiz_entries', :action => 'new'
  map.take_quiz_question '/take_quiz/:id/:question', :controller => 'quiz_entries', :action => 'single_question'  

  map.quiz_results '/results/:id', :controller => 'quiz_entries', :action => 'show'  

  map.like '/like', :controller => 'likes', :action => 'create'
  map.search '/search', :controller => 'quizzes', :action => 'search'
  
  map.random '/random', :controller => 'quizzes', :action => 'random'

  map.faq '/faq', :controller => 'pages', :action => 'faq'
  map.usage '/usage', :controller => 'pages', :action => 'usage'

  map.resources :reports
  map.resources :feedbacks
  map.resources :supports  
  map.resources :comments
  map.resources :groups
  map.resources :users
  map.resources :quizzes
  map.resources :questions
  map.resources :categories
  map.resources :tags, :only => :show
  
  # Clearance::Routes.draw(map)
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  map.root :controller => "pages", :action => "home"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
