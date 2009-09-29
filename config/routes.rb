ActionController::Routing::Routes.draw do |map|

  map.comatose_admin 'admin/cms'
  map.comatose_blog 'blog', :index=>'blog',:layout => 'blog'
  map.resource :session
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.help '/help', :controller => 'landing', :action => 'help'
  map.contact '/contact', :controller => 'landing', :action => 'contact'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'    
  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate', :activation_code => nil
  map.public_resume '/public/resume/:id', :controller => 'resumes', :action => 'public', :id => nil 
  map.login_box '/login_box', :controller => 'sessions', :action => 'login_box' 
  map.search '/search', :controller => 'landing', :action => 'search'
 
  map.forgot_password '/forgot_password',:controller => 'users', :action => 'forgot_password' 
  map.public_resume_pdf '/public/resumes/:salt', :controller => 'resumes', :action => 'public',:format => 'pdf' 
  map.jobs '/jobs',:controller => 'landing',:action => 'jobs'
  map.tools '/tools',:controller => 'landing',:action => 'tools' 
  map.books '/books',:controller => 'landing',:action => 'books'   
  
  # admin 
  
  map.with_options :controller => 'admin' do |admin|
    admin.admin 'admin', :action => 'index'
    admin.send_mail '/admin/mail',:action => 'mail'
    admin.charts 'charts',:action => 'charts',:name_prefix => 'admin_'    
  end
                 
  map.namespace :admin do |admin|
    admin.resources :resumes
    admin.resources :users 
    admin.resources :posters
  end
  
  map.resources :users,:collection => {:reset_password => :post},:member => {:public => :get,:password => :get,:change_password => :put } do |user|
     user.resources :invitations
     user.resources :friendships,:member => {:add => :post}  
     user.resources :messages, :collection => { :delete_selected => :post,:sent_box => :get }
     user.resources :recommendations,:collection => {:ask => :get,:send_request => :post,:sent => :get, :received => :get },:member => {:edit_visible => :get,:visible => :put,:request_revised => :put } 
  end   
  
#  map.resources :groups,:member => { :join => :get,:members => :get,:activity => :get,:pending_members => :get, :managers => :get, } do |group|
#    group.resource :wiki,:member => {:page => :get,:preview => :put, :annotate => :get,:new_page => :get,
#      :create_page => :post, :protect => :post, :rename => [:get,:post], :history => :get, :diff => :get, :special => :get, :page_list => :get } do |w|
#        w.resources :bookmarks
#      end
#    
#  end

  map.resources :resumes, :member => {:publish => :put,:send_to => :get,:do_send => :post,:recommands => :get,:send => :post,:edit_item => :get,:pub => :get} do |resume|
     resume.resources :positions 
     resume.resources :educations
     resume.resource :summary
     resume.resource :personalinfo 
     resume.resource :additionalinfo
     resume.resources :posters,:collection => {:preview => :post }
  end     
  
#  map.group_member '/groups/:id/members/:user_id',:controller => 'groups', :action => 'member'
#  map.edit_group_member '/groups/:id/members/:user_id/edit',:controller => 'groups', :action => 'edit_member'
#  map.update_group_member '/groups/:id/members/:user_id/update',:controller => 'groups', :action => 'update_member'
#  map.group_category '/groups/:id/category/:category_id', :controller => 'categories', :action => 'show'
#  map.accpet_pending_group_member '/groups/:id/members/:user_id/accept', :controller => 'groups', :action => 'accept'
#  map.add_group_admin '/groups/:id/members/:user_id/add_admin', :controller => 'groups', :action => 'add_admin'
#  map.kick_group_member '/groups/:id/members/:user_id/kick', :controller => 'groups', :action => 'kick'   
#  map.reset_group_admin 'groups/:id/:members/:user_id/reset_admin', :controller => 'groups', :action => 'reset_admin'
  


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
 # map.connect ':controller/:action/:id'
 # map.connect ':controller/:action/:id.:format'
end
