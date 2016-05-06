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
  config.run_server = true
  config.server_port = 7000
  config.app_host = "http://localhost:#{Capybara.server_port}"
end