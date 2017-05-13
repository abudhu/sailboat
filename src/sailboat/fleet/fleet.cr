require "colorize"
require "ocean_kit"
require "./*"
require "../configure/configure_functions"

module Sailboat
  class Fleet < Admiral::Command
    define_help

    # Create Fleet
    register_sub_command create, Sailboat::FleetCreate

    # Remove Fleet
    register_sub_command remove, Sailboat::FleetRemove

    # Set Sail Fleet
    register_sub_command start, Sailboat::FleetStart
  end
end
