module Myxy
  # Defines HTTP request methods
  module Request
    # Perform an HTTP GET request
    def get(path, options = {})
      request(:get, path, options)
    end

    # Perform an HTTP POST request
    def post(path, options = {})
      request(:post, path, options)
    end

    # Perform an HTTP PUT request
    def put(path, options = {})
      request(:put, path, options)
    end

    # Perform an HTTP DELETE request
    def delete(path, options = {})
      request(:delete, path, options)
    end

    private

    def build_headers
      headers = {}
      headers["Content-Type"] = "application/#{response_format}"
      headers["Accept"] = "application/#{response_format}"
      headers["Authorization"] = "Token #{api_token}" if api_token
      headers
    end

    # Perform an HTTP request
    def request(method, path, options = {})
      response = connection.send(method) do |request|
        case method
        when :post, :put
          request.url path
          request.body = options[:params].to_json
        when :get, :delete
          request.url path
        end
        request.headers = build_headers
      end
      Response.new(response)
    end
  end
end
