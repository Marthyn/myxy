require 'myxy'
require 'bundler/setup'
require 'webmock/rspec'
require 'simplecov'
require 'simplecov-rcov'

Bundler.setup
WebMock.disable_net_connect!(allow_localhost: true)

SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
SimpleCov.start do
  add_group 'Myxy', 'lib/myxy'
  add_group 'Specs', 'spec'
end


RSpec.configure do |config|
  config.fail_fast = true
  config.include WebMock::API
end
