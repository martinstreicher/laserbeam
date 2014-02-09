require 'awesome_print'
require 'debugger'
require 'factory_girl'
require 'faker'
require 'letters'
require_relative '../lib/laser'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax
end
