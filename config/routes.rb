ActionController::Routing::Routes.draw do |map|

  map.comatose_admin 'admin/cms'

  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.help '/help', :controller => 'landing', :action => 'help'
  map.contact '/contact', :controller => 'landing', :action => 'contact'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'     
  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate', :activation_code => nil
  map.public_resume '/resumes/public/:salt', :controller => 'resumes', :action => 'public', :salt => nil 
  map.login_box '/login_box', :controller => 'sessions', :action => 'login_box' 
  map.admin '/admin', :controller => 'admin/admin', :action => 'index'  
  map.resources :users,:collection => {:reset_password => :put}
  map.forgot_password '/forgot_password',:controller => 'users', :action => 'forgot_password' 
  map.resume_pdf '/resumes/:id/bmtang.pdf', :controller => 'resumes', :action => 'show',:format => 'pdf'

  map.namespace :admin do |admin|
    admin.resources :resumes
    admin.resources :users
  end
  
  map.resource :session

  map.resources :resumes, :member => {:publish => :post,:recommands => :get },:has_one => [:profile,:summary,:additionalinfo] do |resume|
     resume.resources :positions 
     resume.resources :recommands,:collection => {:ask => :get,:send_request => :post}
     resume.resources :educations
     resume.resources :summaries 
     resume.resources :additionalinfos
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
