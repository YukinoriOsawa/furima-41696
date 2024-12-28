source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"

# Use Rails 7.x
gem "rails", "~> 7.0.0"

# Asset pipeline
gem "sprockets-rails"

# MySQL adapter
gem "mysql2", "~> 0.5"

# Puma web server
gem "puma", "~> 5.0"

# ESM import maps
gem "importmap-rails"

# Hotwire framework
gem "turbo-rails"
gem "stimulus-rails"

# Build JSON APIs
gem "jbuilder"

# Use Active Storage variants for image processing
gem "image_processing", "~> 1.2"

# Devise for authentication
gem "devise"

# ActiveHash for static data
gem "active_hash"

# Use Redis adapter to run Action Cable in production (uncomment if needed)
# gem "redis", "~> 4.0"

# Kredis for higher-level Redis types (optional)
# gem "kredis"

# Windows does not include zoneinfo files
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching
gem "bootsnap", require: false

group :development, :test do
  # Debugging
  gem "debug", platforms: %i[mri mingw x64_mingw]

  # RSpec for testing
  gem "rspec-rails", "~> 5.0"

  # FactoryBot for test data
  gem "factory_bot_rails"

  # Faker for generating fake data
  gem "faker"
end

group :development do
  # Console for exceptions pages
  gem "web-console", "~> 4.0"

  # Speed up commands (optional)
  # gem "spring"
end

group :test do
  # System testing tools
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

  gem 'pry-rails'
  gem 'payjp'
gem 'gon'
group :production do
  gem 'pg'
  gem 'unicorn'
end
gem "aws-sdk-s3", require: false