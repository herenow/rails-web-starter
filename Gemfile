source 'https://rubygems.org'

gem 'rails', '~> 5.2'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rollbar'
gem 'virtus'
gem 'omniauth', '~> 1.0'
gem 'omniauth-auth0', '~> 1.0'
gem 'lograge'
gem 'shog'
gem 'puma_worker_killer'
gem 'sidekiq', '~> 5.0'
gem 'sidekiq-scheduler'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'dotenv-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'letter_opener'
end

group :test do
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
