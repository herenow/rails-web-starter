RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do |example|
    if [:feature, :request].include?(example.metadata[:type])
      DatabaseCleaner.strategy  = :truncation
    else
      DatabaseCleaner.strategy  = :transaction
    end

    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
