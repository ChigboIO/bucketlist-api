source "https://rubygems.org"
ruby "2.1.6"

gem "rails", "4.2.4"
gem "rails-api"
gem "active_model_serializers"
gem "faker"
gem "bcrypt"
gem "jwt"

group :development do
  gem "byebug"
end

group :development, :test do
  gem "spring"
  gem "sqlite3"
  gem "rspec-rails", "~> 3.0"
  gem "factory_girl_rails", require: false
  gem "shoulda-matchers", require: false
  gem "database_cleaner"
  gem "coveralls", require: false
  gem "simplecov", require: false
end

group :production do
  gem "pg"
end

# To use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano', :group => :development

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
