require 'simplecov'
SimpleCov.start 'rails'
require 'database_cleaner'
require 'webmock/rspec'
require 'capybara/rspec'

# ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.order = :random

  config.include Capybara::DSL

end

WebMock.disable_net_connect!(allow_localhost: true)
Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :selenium
  config.app_host = 'http://127.0.0.1:3000/' # localhost(rails s)
end