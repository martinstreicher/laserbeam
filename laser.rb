require 'awesome_print'
require 'debugger'
require 'letters'
require_relative 'lib/laser'

ARGV.each do |arg|
  description = Reader.read arg
  room = Room.new description
  answer = room.fire

  puts description
  puts answer
end
