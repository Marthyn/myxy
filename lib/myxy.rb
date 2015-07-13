require "myxy/version"
require "myxy/client"
require "myxy/config"
require "myxy/response"

module Myxy
  extend Config
  # extend Log

  def self.client(options = {})
    Myxy::Client.new(options)
  end

  # Delegate method to client
  def self.method_missing(method, *args, &block)
    super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  # Delegate method to client
  def self.respond_to?(method, include_all = false)
    client.respond_to?(method, include_all) || super
  end
end
