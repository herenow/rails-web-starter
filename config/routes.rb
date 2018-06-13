Rails.application.routes.draw do
  # Authentication
  get '/auth/auth0/callback', to: 'auth0#callback'
  post '/auth/logout', to: 'auth0#logout'
  get '/auth/failure', to: 'auth0#failure'

  # TODO: Enable this is production, implement authentication and authorization
  # to this endpoint before enabling it in production!
  if Rails.env.development?
    mount Sidekiq::Web => '/sidekiq'
  end

  root 'landing#index'
end
