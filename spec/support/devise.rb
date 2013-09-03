# Default user must be created and log in, for any tests to actually work
Rspec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
end