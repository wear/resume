ActionController::Routing::Routes.draw do |map|

  map.comatose_admin 'admin/cms'
  map.resource :session
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.help '/help', :controller => 'landing', :action => 'help'
  map.contact '/contact', :controller => 'landing', :action => 'contact'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'    
  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate', :activation_code => nil
  map.public_resume '/public/resume/:salt', :controller => 'resumes', :action => 'public', :salt => nil 
  map.login_box '/login_box', :controller => 'sessions', :action => 'login_box' 
  map.admin '/admin', :controller => 'admin/admin', :action => 'index'  
 
  map.forgot_password '/forgot_password',:controller => 'users', :action => 'forgot_password' 
  map.public_resume_pdf '/public/resumes/:salt', :controller => 'resumes', :action => 'public',:format => 'pdf' 
  map.jobs '/jobs',:controller => 'landing',:action => 'jobs'
  map.tools '/tools',:controller => 'landing',:action => 'tools' 
  map.books '/books',:controller => 'landing',:action => 'books' 
  
  map.namespace :admin do |admin|
    admin.resources :resumes
    admin.resources :users
  end
  
  map.resources :users,:collection => {:reset_password => :put},:member => {:public => :get } do |user|
     user.resource :profile 
     user.resources :friendships,:member => {:add => :post}  
     user.resources :messages, :collection => { :delete_selected => :post,:sent_box => :get }
     user.resources :recommendations,:collection => {:ask => :get,:send_request => :post,:sent => :get, :received => :get },:member => {:visible => :put,:request_revised => :put } 
  end 

  map.resources :resumes, :member => {:publish => :put,:send_to => :get,:do_send => :post,:recommands => :get,:send => :post,:edit_item => :get} do |resume|
     resume.resources :positions 
     resume.resources :educations
     resume.resource :summary
     resume.resource :personalinfo 
     resume.resource :additionalinfo
     resume.resources :posters,:collection => {:preview => :post }
  end 
  


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
  map.root :controller => "landing"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
