source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.3", ">= 7.0.3.1"
gem "sprockets-rails", '~> 3.4.2'
gem "sqlite3", "~> 1.4"
gem "puma", "~> 5.0"
gem "importmap-rails", "~> 1.1.5"
gem "turbo-rails", "~> 1.3.0"
gem "stimulus-rails", "~> 1.1.0"
gem "jbuilder", "~> 2.11.5"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "devise", "~> 4.8"
gem "will_paginate", "~> 3.3"
gem "tailwindcss-rails", "~> 2.0"
gem "sass-rails", "~> 6.0"
gem "image_processing", "~> 1.12"
gem 'pg', '~> 1.4.3'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails", "~> 5.1"
end

group :development do
  gem "web-console", "~> 4.2.0"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
