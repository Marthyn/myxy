require 'faraday'
require 'uri'
require File.expand_path('../request', __FILE__)
require File.expand_path('../config', __FILE__)

module Myxy
  class Client
    attr_accessor *(Config::VALID_OPTIONS_KEYS)

    # Creates a new API
    def initialize(options = {})
      options = Myxy.options.merge(options)
      Config::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    def connection
      Faraday.new(url) do |faraday|
        faraday.adapter Faraday.default_adapter
        faraday.port = 443
      end
    end

    def url
      URI.join(base_url, version)
    end

    def config
      conf = {}
      Config::VALID_OPTIONS_KEYS.each do |key|
        conf[key] = send key
      end
      conf
    end

    include Request
  end
end
