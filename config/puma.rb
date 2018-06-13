workers ENV.fetch("WEB_CONCURRENCY") { 2 }
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

preload_app!

port        ENV.fetch("PORT") { 3000 }
environment ENV.fetch("RAILS_ENV") { "development" }

on_worker_boot do
  if defined?(ActiveRecord::Base)
    config = ActiveRecord::Base.configurations[Rails.env] ||
                Rails.application.config.database_configuration[Rails.env]
    config['pool'] = threads_count
    ActiveRecord::Base.establish_connection(config)
  end
end

before_fork do
  PumaWorkerKiller.config do |config|
    config.ram           = Integer(ENV['PUMA_WORKER_KILLER_RAM'] || 1024)
    config.frequency     = Integer(ENV['PUMA_WORKER_KILLER_FREQUENCY'] || 10)    # seconds
    config.percent_usage = 0.95
    config.rolling_restart_frequency = Integer(ENV['PUMA_WORKER_KILLER_ROLLING'] || 24) * 3600 # 24 hours in seconds

    config.pre_term = -> (worker) { puts "Worker #{worker.inspect} being killed" }
  end

  PumaWorkerKiller.start
end

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart
