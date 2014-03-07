require 'json'

module Balanced
  class Extracer
    def initialize
      # @json = load_all_json
      @requests = []
      @links = {}
      # examples of the fields of these resources getting set or updated
      @resources_create = Hash.new([])
      @resources_update = Hash.new([])
    end

    def log_request(method, endpoint, request, response)
      # TODO: it would be nice to log the file name and line number for this step
      # then we could look into providing links to the cucumber useage
      if request.is_a? String
        begin
          request = JSON.parse(request)
        rescue
          # WHAT ARE WE EVEN GETTING
          return
        end
      end
      req = {
        method: method,
        endpoing: endpoint,
        request: (request or {}),
        response: (response or {}),
      }
      @requests << req
      if not response
        # likely a 204 with a delete request
        return
      end
      if response['links']
        @links = @links.merge(response['links'])
      end
      # TODO: make these extract from arrays when those are being used
      if endpoint.start_with?($root_url)
        endpoint = endpoint[$root_url.length..-1]
      end
      if method == 'POST'
        # the path is either /[resource_name] or /[some_other_resource]/[guid]/[resource_name]
        # and the resource is getting created
        resource = endpoint.split('/').last
        if resource == 'verifications'  # gaaaaa
          resource = 'bank_account_verifications'
        end
        @resources_create[resource] += [req]
      elsif method == 'PUT'
        # the path will be /[resource_name]/[guid]
        resource = endpoint.split('/')[1]
        if resource == 'verifications'
          resource = 'bank_account_verifications'
        end
        @resources_update[resource] += [req]
      end
      # 'GET' & 'DELETE' requests are ignored, and 'PATCH' can be similar to a 'PUT' in updating
    end

    def save
      file = File.join(File.dirname(__FILE__)+'/../../balanced.rev1.json')
      json = {
        schemas: load_all_json,
        requests: @requests,
        links: @links,
        resources_create: @resources_create,
        resources_update: @resources_update,
        api_secret: $api_secret,
      }
      File.open(file, 'w') do |f|
        f.write(JSON.pretty_generate(json))
      end
    end


    #private

    def resolve_refs(json, path)
      if json.is_a? Hash
        if json['$ref']
          path = File.join(File.dirname(path), json['$ref'])
          json.delete('$ref')
          Hash[resolve_refs(JSON.parse(File.read(path)), path).to_a + json.to_a]
        else
          Hash[json.map do |key, value|
                 [key, resolve_refs(value, path)]
               end]
        end
      elsif json.is_a? Array
        json.map do |j|
          resolve_refs j, path
        end
      else
        json
      end
    end

    def load_all_json
      ret = {}
      path = File.join(File.dirname(__FILE__), "../..", 'fixtures')
      Dir.glob("#{path}/**/*.json") do |f|
        json = resolve_refs(JSON.parse(File.read(f)), f)
        ret[f] = json
      end
      ret
    end

  end
end

$extracer = Balanced::Extracer.new
