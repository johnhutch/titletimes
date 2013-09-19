# Default user must be created and log in, for any tests to actually work
RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
end