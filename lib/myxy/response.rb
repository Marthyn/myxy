require 'json'
module Myxy
  class Response
    attr_accessor :status_code, :body, :response

    ERROR_CODES = [400, 500].freeze

    def initialize(response)
      @response = response
      return false && Log.error(error_message) if error?
    end

    def status_code
      response.status
    end

    def meta
      parsed_body['meta_data']
    end

    def parsed_body
      @parsed_body ||= JSON.parse(response.body)
    end

    def data
      parsed_body['data']
    end

    def error_message
      parsed_body['error']['message']
    end

    def error?
      ERROR_CODES.include? status_code
    end

    def first
      data[0]
    end

    def all
      data
    end
  end
end
