Rails.application.config.middleware.use OmniAuth::Builder do
  if ENV['AUTH0_CLIENT_ID'].present? &&
     ENV['AUTH0_CLIENT_SECRET'].present? &&
     ENV['AUTH0_DOMAIN'].present?
    provider(
      :auth0,
      ENV.fetch('AUTH0_CLIENT_ID'),
      ENV.fetch('AUTH0_CLIENT_SECRET'),
      ENV.fetch('AUTH0_DOMAIN'),
      callback_path: "/auth/auth0/callback"
    )
  else
    puts(
      "\nAUTH0 enviromnet variables not present!\n" +
      "---------------------\n" +
      "Read the README for instruction.\n" +
      "---------------------\n"
    )
  end
end
