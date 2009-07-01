# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_resume_session',
  :secret      => 'c17df6ca964738093e3e5bf1957fa498780f3e5e885517894c141e36dfa9e74f281867d3e322bc0ddab3b60adad106ad48af03670a570ba0be4258e50c3d3356'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
