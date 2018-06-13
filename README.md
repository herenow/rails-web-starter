# Rails 5 Web Starter ☀️

[![CircleCI](https://circleci.com/gh/herenow/rails-web-starter.svg?style=svg)](https://circleci.com/gh/herenow/rails-web-starter)

Basic Rails setup w/ everything I generally use and need to start a web app.

[Demo running in Heroku](https://rails-web-starter.herokuapp.com)

## Content guide 📜
* [Getting started](#getting-started)
* [Stack](#stack)
* [Required services](#required-services)

## <a name="getting-started"></a> Getting started 🔧

```bash
git clone git@github.com:herenow/rails-web-started.git

cd rails-web-starter

cp config/database.yml.example config/database.yml
cp .env.example .env

bundle install

rails server
```

Open [.env.example](https://github.com/herenow/rails-web-starter/blob/master/.env.example) for a list of available environment variables to set.

### Setting up user authentication

Goto [https://auth0.com/](https://auth0.com/), create an account, setup a project and get your `AUTH0_CLIENT_ID` `AUTH0_CLIENT_SECRET` `AUTH0_DOMAIN` access keys.

Update your `.env` file with those keys.

You should have different keys/projects for development, staging and production.

#### Optional (rename app name)

```bash
# Open config/application.rb
#
# Change:
# ...
# module RailsWebStarted
# ...
#
# Open config/database.yml
#
# Change all occurences of:
# ...
# rails-web-starter
# ...

sed -i '' s/RailsWebStarted/MyAwesomeApp/g config/application.rb
sed -i '' s/rails-web-starter/my_awesome_app/g config/database.yml
sed -i '' s/rails_web_starter/my_awesome_app/g config/environments/production.rb
sed -i '' s/rails_web_starter/my_awesome_app/g config/environments/development.rb
```

## <a name="stack"></a> Stack 🔥

Major stack choices:

### Frontend

TODO: Describe frontend stack

### Backend

* [PostgreSQL](https://www.postgresql.org/) - Primary database, full-text search and geolocation
* [Auth0](https://auth0.com/) - User authentication service
* [RSpec](https://github.com/rspec/rspec-rails) - Testing framework of choice
* [FactoryGirl](https://github.com/thoughtbot/factory_girl) - "Mocked" objects for tests, instead of fixtures
* [Rollbar](https://rollbar.com/) - Error monitoring
* [Dotenv](https://github.com/bkeepers/dotenv) - To manage and document environment variables in development
* [Virtus](https://github.com/solnic/virtus) - Defining data objects
* [LetterOpener](https://github.com/ryanb/letter_opener) - View sent emails in the browser (in development)
* [Lograge](https://github.com/roidrage/lograge) - Less noisy & more parsable production logs
* [Shog](https://github.com/phallguy/shog) - Colored logging
* [PumaWorkerKiller](https://github.com/schneems/puma_worker_killer) - Restart Rails when memory consumption threshold is exceeded

### Analytics

TODO: Describe analytics stack

## <a name="required-services"></a> Required services

You will need to run the following services:

### All environments

* [PostgreSQL](https://postgresapp.com/) - I recommend using [Postgres.app](https://postgresapp.com/) in Development on a mac.

### Production specific

TODO: Describe
