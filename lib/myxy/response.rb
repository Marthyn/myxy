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
      response.meta
    end

    def data
      response.data
    end

    def first
      "Myxy::#{resource}".constantize.new(data[0])
    end

    def all
      results = []
      data.each do |item|
        results << "Myxy::#{resource}".constantize.new(item)
      end
      results
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
