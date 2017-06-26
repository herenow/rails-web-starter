Rails.application.routes.draw do
  # Authentication
  get '/auth/auth0/callback', to: 'auth0#callback'
  post '/auth/logout', to: 'auth0#logout'
  get '/auth/failure', to: 'auth0#failure'

  root 'landing#index'
end
