require "admiral"
require "../**"

module Sailboat
  class CLI < Admiral::Command
    define_help
    register_sub_command configure, Sailboat::Configure
    register_sub_command map, Sailboat::Map
    #def run
    #  puts "⛵ Sailboat away!"
    #end
  end
end
