## Rails 5 Web Starter ☀️

Basic Rails setup w/ everything I generally use and need to start a web app.

* [Getting started](#getting-started)
* [Stack](#stack)
* [Required services](#required-services)

### <a name="getting-started"></a> Getting started 🔧 

```bash
git clone git@github.com:herenow/rails-web-started.git

cd rails-web-starter

cp .env.example .env

bundle install

rails server
```

Open [.env.example](https://github.com/herenow/rails-web-starter/blob/master/.env.example) for a list of available environment variables to set.

##### Optional (rename app name)

```bash
# Change:
# ...
# module RailsWebStarted
# ...
#
# to whatever to want

vim config/application.rb
```

### <a name="stack"></a> Stack 🔥

Major stack choices:

#### Frontend

TODO: Describe frontend stack

#### Backend

* [PostgreSQL](https://www.postgresql.org/) - Primary database, full-text search and geolocation
* [Rollbar](https://rollbar.com/) - Error monitoring
* [Dotenv](https://github.com/bkeepers/dotenv) - To manage and document environment variables in development
* [Virtus](https://github.com/solnic/virtus) - Defining data objects

#### Analytics

TODO: Describe analytics stack

### <a name="required-services"></a> Required services

You will need to run the following services:

#### All environments

* [PostgreSQL](https://postgresapp.com/) - I recommend using [Postgres.app](https://postgresapp.com/) in Development on a mac.

#### Production specific

TODO: Describe
