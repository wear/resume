Sitemap::Routes.host = APP_URL
Sitemap::Routes.priority = 0.8    # default is 1.0  

Sitemap::Routes.draw do |map|
  map.public_resume '/public/resume/:id', :controller => 'resumes', :action => 'public'
  map.comatose_blog 'blog', :index=>'blog',:layout => 'blog'
  map.help '/help', :controller => 'landing', :action => 'help'
  map.contact '/contact', :controller => 'landing', :action => 'contact'
  map.jobs '/jobs',:controller => 'landing',:action => 'jobs'
  map.tools '/tools',:controller => 'landing',:action => 'tools' 
  map.books '/books',:controller => 'landing',:action => 'books'
  map.root :controller => "landing"
end
