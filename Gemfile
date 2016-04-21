source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use postgresql as the database for Active Record
gem 'pg'

# assets
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
gem 'autoprefixer-rails'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'

# views
gem 'simple_form'
gem 'bootstrap-sass'
gem 'font-awesome-rails'
gem 'haml-rails'

# other
gem 'seedbank'
gem 'thin'


# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'bullet'
  gem 'foreman'
  gem 'letter_opener'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-commands-rspec'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'guard-bundler', require: false
  gem 'guard-rails', require: false
  gem 'guard-migrate'
  gem 'guard-annotate'
  gem 'guard-haml'
end

group :test do
  gem 'simplecov', require: false
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'formulaic'
  gem 'launchy'
  gem 'shoulda-matchers', require: false
  gem 'timecop'
  gem 'webmock', require: false
end

group :staging, :production do
  gem 'rails_12factor'
  gem 'newrelic_rpm'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'awesome_print'
  gem 'brakeman', '~>3.2.1', require: false
  gem 'bundler-audit'
  gem 'byebug'
  gem 'factory_girl_rails'
  gem 'fuubar', '~> 2.0.0'
  gem 'jasmine', ' 2.4.0'
  gem 'jasmine-jquery-rails'
  gem 'pry-rails'
  gem 'rails_best_practices', '~> 1.16.0'
  gem 'rspec-rails', '~> 3.4.2'
  gem 'rubocop'
  gem 'scss_lint', require: false
  gem 'guard-rspec', require:  false
  gem 'guard-jasmine', git: "git://github.com/guard/guard-jasmine.git", branch: "jasmine-2"

end
