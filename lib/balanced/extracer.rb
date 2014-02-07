require 'json'

module Balanced
  class Extracer
    def initialize
     # @json = load_all_json
      @requests = []
      @links = {}
    end

    def log_request(method, endpoint, request, response)
      # TODO: it would be nice to log the file name and line number for this step
      # then we could look into providing links to the cucumber useage
      require 'debugger'; debugger
      @requests << {
        method: method,
        endpoing: endpoint,
        request: request,
        response: response
      }
      if response['links']
        @links = @links.merge(response['links'])
      end
      # TODO: make these extract from arrays when those are being used
      if method == 'POST'

      elsif method == 'PUT'

      end
    end

    def save
      file = File.join(File.dirname(__FILE__)+'/../../balanced.rev1.json')
      json = {
        schemas: load_all_json,
        requests: @requests,
        links: @links
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
      path = File.join(File.dirname(__FILE__), "../..", 'fixtures/responses')
      Dir.glob("#{path}/**/*.json") do |f|
        json = resolve_refs(JSON.parse(File.read(f)), f)
        ret[f] = json
      end
      ret
    end

  end
end

$extracer = Balanced::Extracer.new
