source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

gem "rails"
gem "devise"
gem "devise-i18n"
gem "rails-i18n"

gem 'dotenv-rails'
gem 'mailjet'

gem "gravtastic"
gem "sprockets-rails"

gem "puma"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
# gem "aws-sdk-s3"
gem "image_processing"
gem 'pundit', '~> 2.2.0'

gem 'font-awesome-sass'

gem "carrierwave"
gem "rmagick"

gem "bootsnap"

group :production do
  gem "pg"
  gem 'rails_12factor'
end

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "letter_opener"

  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 6.0.0.rc1'
  gem 'rubocop', '~> 1.31.0'
  gem 'shoulda-matchers'
  gem 'sqlite3', '~> 1.4'
  gem 'capybara'
  gem 'launchy'

  gem 'capistrano', '~> 3.10'
  gem 'capistrano-rails', '~> 1.3'
  gem 'capistrano-passenger'
  gem 'capistrano-rbenv', '~> 2.2'
  gem 'capistrano-bundler', '~> 2.0'
  gem 'capistrano-ssh-doctor', '~> 1.0'
  gem 'capistrano-master-key', '~> 1.0.0'
end

gem 'net-ssh', '>= 6.0.2'
gem 'ed25519', '>= 1.2', '< 2.0'
gem 'bcrypt_pbkdf', '>= 1.0', '< 2.0'

gem "redis", "~> 4.0"
