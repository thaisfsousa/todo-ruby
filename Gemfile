# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

gem 'rails', '~> 7.1.3', '>= 7.1.3.4'

gem 'sprockets-rails'

gem 'sqlite3', '~> 1.4'

gem 'puma', '>= 5.0'

gem 'importmap-rails'

gem 'turbo-rails'

gem 'stimulus-rails'

gem 'jbuilder'

gem 'tzinfo-data', platforms: %i[windows jruby]

gem 'bootsnap', require: false

group :development, :test do
  gem 'byebug', '~> 9.0', '>= 9.0.6'
  gem 'debug', platforms: %i[mri windows]
  gem 'factory_bot_rails'
end

group :development do
  gem 'rubocop', require: false
  gem 'web-console'
end

group :test do
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'simplecov', require: false
end
