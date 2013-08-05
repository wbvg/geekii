ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...

# ENV["RAILS_ENV"] = "test"
# DEVISE_ORM = (ENV["DEVISE_ORM"] || :active_record).to_sym

# $:.unshift File.dirname(__FILE__)
# puts "\n==> Devise.orm = #{DEVISE_ORM.inspect}"

# module Devise
#   # Detection for minor differences between Rails 3.2 and 4 in tests.
#   def self.rails4?
#     Rails.version.start_with? '4'
#   end
# end

# require "rails_app/config/environment"
# require "rails/test_help"
# require "orm/#{DEVISE_ORM}"

# I18n.load_path << File.expand_path("../support/locale/en.yml", __FILE__)

# require 'mocha/setup'
# require 'webrat'
# Webrat.configure do |config|
#   config.mode = :rails
#   config.open_error_files = false
# end

# # Add support to load paths so we can overwrite broken webrat setup
# $:.unshift File.expand_path('../support', __FILE__)
# Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# # For generators
# require "rails/generators/test_case"
# require "generators/devise/install_generator"
# require "generators/devise/views_generator"




end
