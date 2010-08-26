# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_quiz_session',
  :secret      => '789f7fa7dffbdb8467524b4c41842657bb1bddd9f995da9df1f48557bdff4eb1808d96d6e297314da8e1d6b80dd40ea4ed55c388cf4ae5bff465f4e47fa59af2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
