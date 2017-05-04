require "json"
module Sailboat
  class MapCache
    def initialize(cache_path : String)
      @cache_path = cache_path
    end
    def get_cache
      if File.exists?(@cache_path)
        JSON.parse(File.open(@cache_path))
      end
    end
  end
end
