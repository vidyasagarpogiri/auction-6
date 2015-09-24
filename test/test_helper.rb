ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/reporters'

class ActiveSupport::TestCase
  fixtures :all
end

Minitest::Reporters.use!
DatabaseCleaner.strategy = :truncation

class MiniTest::Test
  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
    Timecop.return
  end
end
