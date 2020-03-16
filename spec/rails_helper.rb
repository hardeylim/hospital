# frozen_string_literal: true

ENV['RAILS_ENV'] = 'test'
require 'simplecov'
require File.expand_path('../config/environment', __dir__)
require 'rspec/rails'

SimpleCov.start :rails do
  add_group 'Models', 'app/models'
  add_group 'Controllers', 'app/controllers'
  add_group 'Services', 'app/services'
end

Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

# reduce IO overhead
Rails.logger.level = 4

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.tty = true
end
