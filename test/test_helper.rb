require 'simplecov'
SimpleCov.start 'rails'
ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest"
require 'minitest/rails'
require 'minitest/reporters'
require 'minitest_extensions'
require 'contexts'

class ActiveSupport::TestCase
  # Since we are not using fixtures, comment this line out...
  # fixtures :all
  # Rails builds fixtures automatically

  include Contexts # calling all the methods define in contexts.rb

  # Add more helper methods to be used by all tests here...
    # Spruce up minitest results...
  Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]

end
