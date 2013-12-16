require 'json-schema'

module Balanced
  module MinAPI
    class Client
      attr_reader :api_secret, :root_url
      attr_reader :responses
      attr_writer :running

      def initialize(api_secret, accept_header, root_url)
        @api_secret = api_secret
        @accept_header = accept_header
        @root_url = root_url

        @responses = []
      end

      def POST (endpoint, body)
        body = JSON.parse(body) if body.is_a? String
        options = {
          headers: {
            'Accept' => @accept_header,
          },
          body: body,
          basic_auth: {
            username: @api_secret,
            password: '',
          }
        }

        response = HTTParty.post("#{@root_url}#{endpoint}", options)
        @responses << response
        response
      end

      def GET(endpoint)
        verb 'GET', endpoint
      end

      def RAW(response)
        @responses << response
      end

      def verb (verb, url)
        options = {
          headers: {
            'Accept' => @accept_header
          },
          basic_auth: {
            username: @api_secret,
            password: '',
          }
        }
        response = HTTParty.send(verb.downcase, "#{$root_url}#{url}", options)
        @responses << response
        response
      end

      def code
        @responses.last.code
      end

      def body
        if @responses.last.body
          JSON.parse(@responses.last.body)
        end
      end

      def inject(key)
        # hax to access a Ruby hash like dot notation
        key.split('.').inject(body) {|o, k| Array(o[k])[0] }
      end

      def validate(against)
        file_name = File.join('fixtures', "#{against}.json")
        if File.exists? file_name and not against.is_a? Hash
          JSON::Validator.validate!(file_name, body)
        else
          JSON::Validator.validate!(against, body)
        end
      end

      def [](name)
        # either access some type by name, or access a field on an object if there was only one
        if body.has_key? name
          body[name][0]
        else
          body.select { |x| x != 'links' and x != 'meta' }.values.first.first[name]
        end
      end
    end
  end
end
