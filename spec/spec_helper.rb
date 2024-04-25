# spec/spec_helper.rb
ENV['RACK_ENV'] = 'test'

require 'rspec'
require 'rack/test'

require_relative '../string_calculator' # Assuming your Sinatra app file is named app.rb

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

def app
  Sinatra::Application
end