module Sailboat
  class MapFunctions

    macro client_get(name, command)
      JSON.parse(client.{{name}}.{{command}})["{{name}}"]
    end

    def get_info(client)
      complete_json = {} of String => JSON::Any
      complete_json["certificates"] =  client_get certificates, all
      complete_json["domains"] =  client_get domains, all
      complete_json["droplets"] =  client_get droplets, all
      complete_json["floating_ips"] =  client_get floating_ips, all
      complete_json["images"] =  client_get images, all_private
      complete_json["load_balancers"] =  client_get load_balancers, all
      complete_json["snapshots"] =  client_get snapshots, all
      complete_json["ssh_keys"] =  client_get ssh_keys, all
      complete_json["volumes"] =  client_get volumes, all
      complete_json
      #File.write("/home/amit/Documents/mapping.json", complete_json.to_pretty_json)
    end
  end
end
