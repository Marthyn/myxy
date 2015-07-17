require 'json'
module Myxy
  class Response
    attr_accessor :status_code, :body, :response

    def initialize(response)
      @response = response
    end

    def status_code
      response.status_code
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

    def first
      data[0]
    end

    def all
      data
    end
  end

  class ErrorResponse < Response
    def error_code
      reponse.error.code
    end

    def error_message
      reponse.error.message
    end
  end
end
