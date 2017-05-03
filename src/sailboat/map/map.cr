require "colorize"
require "ocean_kit"
require "./*"
require "../configure/configure_functions"

module Sailboat
  class Map < Admiral::Command
    define_help
    define_flag profile,
      description: "Sailboat Profile",
      long: profile,
      short: p,
      default: "default",
      required: false
    define_flag detailed,
      description: "Detailed description of your Digital Ocean Env",
      long: detailed,
      short: d,
      required: false
    define_flag output,
      description: "Output location of the map file",
      long: output,
      short: o,
      required: true
    def run
      cf = Sailboat::ConfigureFunctions.new

      unless cf.configure_check_profile(flags.profile)
        abort("⛵ Invalid profile #{flags.profile}".colorize(:red))
      end

      ocean_kit = OceanKit::Client.new(cf.configure_retrieve_token flags.profile)

      if flags.detailed.nil?
        map_short = Sailboat::MapShort.new(client: ocean_kit, output_loc: flags.output)
        map_short.run
      end


    end
  end
end
