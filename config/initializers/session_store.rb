# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Skule2_session',
  :secret      => 'c3823c192438442e01a563a0e0c63475675876428b0d43a993847b3a9f4b50a99e63b852a9244068d77987419cdfde9ae6f02ea0050d0a8cc969c020a8d81745'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
