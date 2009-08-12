# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.2.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Specify gems that this application depends on and have them installed with rake gems:install
  # config.gem "bj"
  # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
  # config.gem "sqlite3-ruby", :lib => "sqlite3"
  # config.gem "aws-s3", :lib => "aws/s3"
  # Only load the plugins named here, in the order given (default is alphabetical).
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]
  
  require 'prawn' 

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer
   config.active_record.observers = :user_observer,:message_observer     
  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'Beijing'

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  config.i18n.default_locale = 'cn'
end  

ExceptionNotifier.exception_recipients = %w(wear63659220@gmail.com support@muutang.com)   
 
ActionMailer::Base.smtp_settings = {
   :tls => true,
   :address => "smtp.gmail.com",
   :port => "587",
   :domain => "muutang.com",
   :authentication => :plain,
   :user_name => "support@muutang.com",
   :password => "tellmewhy" 
 }          

 ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|  
   msg = instance.error_message  
   error_style = "background-color: #ffffff"  
   if html_tag =~ /<(input|textarea|select)[^>]+style=/  
     style_attribute = html_tag =~ /style=['"]/  
     html_tag.insert(style_attribute + 7, "#{error_style}; ")  
   elsif html_tag =~ /<(input|textarea|select)/  
     first_whitespace = html_tag =~ /\s/  
     html_tag[first_whitespace] = " style='#{error_style}' "  
   end  
   html_tag  
 end
 
