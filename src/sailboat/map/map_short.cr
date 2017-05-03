require "json"
require "ocean_kit"
require "./*"

module Sailboat
  class MapShort < Sailboat::MapFunctions

    def initialize(client : OceanKit::Client, output_loc : String)
      @client = client
      @output_loc = output_loc
    end

    def run
      infrastructure_map = get_info(client: @client)
      # So what we want to do is, generate that mapping once.  Then
      # place it in the .sailboat.
      # then we need to expire that file, so its a local cache
      # read from the cache.  Which means you need a --refresh flag to
      # invalidate the cache

      #puts infrastructure_map
      #puts typeof(infrastructure_map) # => Hash(String, JSON::Any)

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


    end
  end
end
