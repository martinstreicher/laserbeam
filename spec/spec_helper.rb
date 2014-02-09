require_relative '../lib/laser'
require 'awesome_print'
require 'debugger'
require 'factory_girl'
require 'faker'
require 'letters'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax
end
