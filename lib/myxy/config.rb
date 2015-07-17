require 'faraday'

module Myxy
  module Config
    # An array of valid keys in the options hash
    VALID_OPTIONS_KEYS = [
      :api_token,
      :adapter,
      :connection_options,
      :response_format,
      :version,
      :base_url
    ].freeze

    # The adapter that will be used to connect if none is set
    #
    # @note The default faraday adapter is Net::HTTP.
    DEFAULT_ADAPTER = Faraday.default_adapter

    # Version V2 is the only valid version at the moment
    DEFAULT_VERSION = 'v2'

    # Base url is beta now
    DEFAULT_BASE_URL = 'https://beta.calendar42.com/app/django/api/'

    DEFAULT_FORMAT = :json

    # @private
    attr_accessor *(VALID_OPTIONS_KEYS)

    # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
    end

    # Create a hash of options and their values
    def options
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end

    # Reset all configuration options to defaults
    def reset
      self.adapter            = DEFAULT_ADAPTER
      self.api_token          = ENV['API_TOKEN']
      self.connection_options = nil
      self.base_url           = DEFAULT_BASE_URL
      self.version            = DEFAULT_VERSION
      self.response_format    = DEFAULT_FORMAT
    end
  end
end
