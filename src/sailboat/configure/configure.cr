require "colorize"
require "./*"

module Sailboat
  class Configure < Admiral::Command
    define_help
    define_flag profile,
      description: "Add a named profile.",
      long: profile,
      short: p,
      required: false
    def run

      cf = Sailboat::ConfigureFunctions.new

      if flags.profile.nil?
        puts "⛵ Welcome aboard! Let's setup your default profile.".colorize.mode(:bold)
        profile_name = "default"
      else
        puts "⛵ Welcome aboard! Let's setup <#{flags.profile}> profile.".colorize.mode(:bold)
        profile_name = flags.profile
      end

      print "Digital Ocean Token: "
      input_token = gets
      cf.configure_add_profile(profile_name: profile_name, profile_token: input_token)
    end
  end
end
