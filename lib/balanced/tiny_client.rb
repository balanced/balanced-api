require 'json-schema'

module Balanced
  class TinyClient
    attr_reader :api_secret, :root_url
    attr_reader :responses
    attr_reader :hydrate_tokens
    attr_writer :running

    def initialize(api_secret, accept_header, root_url)
      @api_secret = api_secret
      @accept_header = accept_header
      @root_url = root_url

      @responses = []
      @hydrate_tokens = {}
    end

    def post(endpoint, body, env={})
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

      url = expand_url(endpoint, env)

      response = HTTParty.post(url, options)
      @responses << response
      response
    end

    def expand_url(endpoint, env)
      require 'uri_template'
      # I am so sorry
      template = "#{@root_url}#{endpoint}".gsub(/{(.*?)}/) do
        "{#{$1.gsub(".", "_")}}"
      end
      $logger.debug("expanding: #{template} with env: #{env}")
      # TODO: does using . in uri variables make sense? http://tools.ietf.org/html/rfc6570#section-3.2.1
      template = URITemplate.new(template)
      url = template.expand(env)
      $logger.debug("expanded: #{url}")
      url
    end

    def put(endpoint, body, env={})
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

      response = HTTParty.put("#{@root_url}#{endpoint}", options)
      @responses << response
      response
    end

    def patch(endpoint, body)
      body = JSON.parse(body) if body.is_a? String
      options = {
        headers: {
          'Accept' => @accept_header,
          'Content-Type' => "application/json", # github: https://github.com/balanced/balanced-api/issues/458
        },
        body: JSON.dump(body), # sometimes we send arrays and then it gets confused
        basic_auth: {
          username: @api_secret,
          password: '',
        }
      }

      response = HTTParty.patch("#{@root_url}#{endpoint}", options)
      @responses << response
      response
    end

    def get(endpoint, body=nil, env={})
      verb 'GET', endpoint, env
    end

    def delete(endpoint, body=nil, env={})
      verb 'DELETE', endpoint
    end

    def add_response(response)
      @responses << response
    end

    def verb(verb, url, env={}, body=nil)
      options = {
        headers: {
          'Accept' => @accept_header,
          'Content-Type' => "application/json", # github: https://github.com/balanced/balanced-api/issues/458
        },
        body: JSON.dump(body), # sometimes we send arrays and then it gets confused
        basic_auth: {
          username: @api_secret,
          password: '',
        }
      }

      options[:body] = body if body

      url = expand_url(url, env)

      response = HTTParty.send(verb.downcase, url, options)
      @responses << response
      response
    end

    def last_code
      @responses.last.code
    end

    def last_body
      if @responses.last.body
        JSON.parse(@responses.last.body)
      end
    end

    def inject(key)
      # hax to access a Ruby hash like dot notation
      key.split('.').inject(last_body) {|o, k| Array(o[k])[0] }
    end

    def hydrater(what)
      @hydrate_tokens.each_pair do |key, value|
        if key.class == Symbol
          key = ":#{key}"
        end
        what = what.gsub(key, value)
      end
      what
    end

    def add_hydrate(key, value)
      @hydrate_tokens[key] = value
    end

    def validate(against)
      file_name = File.join(File.dirname(__FILE__), "../..", 'fixtures', "#{against}.json")
      if File.exists?(file_name) and not against.is_a? Hash
        JSON::Validator.validate!(file_name, last_body)
      else
        JSON::Validator.validate!(against, last_body)
      end
    end

    def [](name)
      # either access some type by name, or access a field on an object if there was only one
      if last_body.has_key? name
        last_body[name][0]
      else
        last_body.select { |x| x != 'links' and x != 'meta' }.values.first.first[name]
      end
    end
  end
end
