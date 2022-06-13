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
gem "aws-sdk-s3"
gem "image_processing"
gem 'turbo-rails'

gem 'font-awesome-sass'

gem "carrierwave"
gem "rmagick"

gem "bootsnap"


group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "letter_opener"
end

group :production do
  gem "pg"
  gem 'rails_12factor'
end

gem "redis", "~> 4.0"