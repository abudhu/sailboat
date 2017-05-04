require "json"
require "ocean_kit"
require "./*"

module Sailboat
  class MapDetailed < Sailboat::MapFunctions
    def initialize(client : OceanKit::Client, output_loc : String)
      @client = client
      @output_loc = output_loc
    end
    
    def run
    end

  end
end
