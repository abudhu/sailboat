require "colorize"
require "json"
require "ocean_kit"
require "./*"

module Sailboat
  class MapShort < Sailboat::MapFunctions

    def initialize(client : OceanKit::Client, output_loc : String, refresh : Bool)
      @client = client
      @output_loc = output_loc
      @refresh = refresh
    end

    def run

      if check_cache == false || @refresh == true
        puts "⛵ Generating cache copy of map...".colorize.mode(:dim)
        infrastructure_map = get_info(client: @client)
      else
        puts "⛵ Using cache copy of map".colorize.mode(:dim)
        infrastructure_map = get_cache
      end

      json_string = JSON.build do |json|
        json.object do
          json.field "certificates" do
            json.array do
              infrastructure_map["certificates"].each do |certificate|
                json.string certificate["name"]
              end
            end
          end
          json.field "domains" do
            json.array do
              infrastructure_map["domains"].each do |domain|
                json.string domain["name"]
              end
            end
          end
          json.field "droplets" do
            json.array do
              infrastructure_map["droplets"].each do |droplet|
                json.string droplet["name"]
              end
            end
          end
          json.field "floating_ips" do
            json.array do
              infrastructure_map["floating_ips"].each do |floating_ip|
                json.string floating_ip["ip"]
              end
            end
          end
          json.field "user_images" do
            json.array do
              infrastructure_map["images"].each do |image|
                json.string image["name"]
              end
            end
          end
          json.field "load_balancers" do
            json.array do
              infrastructure_map["load_balancers"].each do |load_balancer|
                json.string load_balancer["name"]
              end
            end
          end
          json.field "snapshots" do
            json.array do
              infrastructure_map["snapshots"].each do |snapshot|
                json.string snapshot["name"]
              end
            end
          end
          json.field "sshkeys" do
            json.array do
              infrastructure_map["ssh_keys"].each do |ssh_key|
                json.string ssh_key["name"]
              end
            end
          end
          json.field "volumes" do
            json.array do
              infrastructure_map["volumes"].each do |volume|
                json.string volume["name"]
              end
            end
          end
        end
      end

      File.write(@output_loc, JSON.parse(json_string).to_pretty_json)
      puts "⛵ Success! We have placed your map at #{@output_loc}"

    end
  end
end
