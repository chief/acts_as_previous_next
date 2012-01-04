require 'rubygems'
require 'spork'
require 'factory_girl'
require 'database_cleaner'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../dummy/config/environment", __FILE__)

  require 'rspec/rails'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    # == Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    # config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr
    config.mock_with :rspec

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = false

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    config.infer_base_class_for_anonymous_controllers = false

    config.use_instantiated_fixtures = false

    # Use DatabaseCleaner to enable js testing
    config.before(:suite) do
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.clean_with(:truncation)
    end

    config.before(:each) do
      #Timecop.return
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end

    config.before(:all) do
      #DeferredGarbageCollection.start
    end

    config.after(:all) do
      #DeferredGarbageCollection.reconsider
    end

    # Add helpers for devise authentication
    #config.include Devise::TestHelpers, type: :controller
    #config.extend ControllerMacros, type: :controller

    # Also include warden
    #config.include Warden::Test::Helpers
    #config.after(:each) { Warden.test_reset!}

    # Include factory_girl's helpers
    #config.include FactoryGirl::Syntax::Methods
  end
end

Spork.each_run do
  FactoryGirl.find_definitions
end

