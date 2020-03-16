# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
require File.expand_path('../config/environment', __dir__)
require 'rspec/rails'
require 'database_cleaner'

Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

# reduce IO overhead
Rails.logger.level = 4

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.tty = true
end

FactoryGirl::SyntaxRunner.class_eval do
  include ActionDispatch::TestProcess
end
