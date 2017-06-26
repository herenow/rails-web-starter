class Auth0Controller < ApplicationController
  def callback
    auth = request.env.fetch('omniauth.auth')
    info = auth.fetch('info')

    result = UserAuthenticator.new(
      auth0_uid: auth.fetch('uid'),
      auth0_info: info,
    ).call

    session[:user_id] = result.user.id

    if result.new_user?
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def logout
    session[:user_id] = nil

    redirect_to(
      "https://#{ENV.fetch('AUTH0_DOMAIN')}/v2/logout?" +
      "client_id=#{ENV.fetch('AUTH0_CLIENT_ID')}&" +
      "returnTo=#{URI.encode(root_url)}"
    )
  end

  def failure
    render text: 'Not implemented', status: 200
  end
end
