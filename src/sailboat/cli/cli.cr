require "admiral"
require "../**"

module Sailboat
  class CLI < Admiral::Command
    define_help
    # Configure Sailboat
    register_sub_command configure, Sailboat::Configure

    # Map A DigitalOcean Environment
    register_sub_command map, Sailboat::Map

    # Create A DigitalOcean Environment based on a Map
    # register_sub_command create, Sailboat::Create

    # Destory A DigitalOcean Environment
    # register_sub_command destory, Sailboat::Destory

    # Create an Autoscaling Group for a Droplet
    # You must run this as a Background task
    register_sub_command fleet, Sailboat::Fleet

  end
end
