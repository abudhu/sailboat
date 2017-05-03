require "json"

module Sailboat

  class ConfigureFunctions
    def initialize
      @config_folder_path = "#{ENV["HOME"]}/.sailboat"
      @config_file_path = "#{@config_folder_path}/config"
      @json_file = {} of String => JSON::Type
      @json_file = JSON.parse(File.read(@config_file_path)).as_h

      configure_check_path(path: @config_folder_path, type: "folder")
      configure_check_path(path: @config_file_path, type: "file")
    end

    def configure_add_profile(profile_name, profile_token)
      @json_file["#{profile_name}"] = profile_token
      File.write(@config_file_path, @json_file.to_pretty_json)
    end

    def configure_check_profile(profile_name)
      @json_file.has_key?(profile_name)
    end

    def configure_retrieve_token(profile_name)
      @json_file[profile_name].to_s
    end

    private def configure_check_path(path, type)
      case type
      when "folder"
        unless Dir.exists? path
          Dir.mkdir_p(path)
        end
      when "file"
        unless File.exists? path
          File.write(path,"{}")
        end
      end
    end

  end
end
