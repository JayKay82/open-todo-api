source 'https://rubygems.org'
ruby '2.2.2'

# Rails
gem 'rails', '4.2.3'

# Databases: Sqlite (dev and test), Postgres (production)
gem 'sqlite3', group: [:development, :test]

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Testing
group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'shoulda-matchers', '~> 3.0'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'airborne'
end

# Serializer
gem 'active_model_serializers', '0.9.2'

# Other gems
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
end
