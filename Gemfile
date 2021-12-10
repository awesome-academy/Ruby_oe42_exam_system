source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "2.7.0"
gem "bcrypt", "3.1.13"
gem "bootsnap", ">= 1.4.2", require: false
gem "bootstrap-kaminari-views"
gem "bootstrap-sass", "3.4.1"
gem "cocoon"
gem "config"
gem "image_processing", "1.9.3"
gem "jbuilder", "~> 2.7"
gem "kaminari"
gem "mini_magick", "4.9.5"
gem "mysql2", ">= 0.4.4"
gem "puma", "~> 3.11"
gem "rails", "~> 6.0.0"
gem "sass-rails", "~> 5"
gem "turbolinks", "~> 5"
gem "webpacker", "~> 4.0"

group :development do
  gem "bullet"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "pry-rails"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end
gem "faker", "2.1.2"
gem "rails-i18n"
group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "shoulda-matchers", require: false
  gem "webdrivers"
end
group :development, :test do
  gem "byebug", platforms: %i(mri mingw x64_mingw)
  gem "factory_bot_rails"
  gem "rails-controller-testing"
  gem "rspec-rails", "~> 4.0.1"
  gem "rubocop", "~> 0.74.0", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "rubocop-rails", "~> 2.3.2", require: false
  gem "simplecov"
  gem "simplecov-rcov"
end

gem "tzinfo-data", platforms: %i(mingw mswin x64_mingw jruby)
