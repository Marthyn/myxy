require 'uri'
require File.expand_path("../utils", __FILE__)

module Myxy
  module Resource
    attr_accessor :attributes

    def save
      if self.id
        uri = URI.join(base_path, id)
        Myxy.put(uri.to_s, attributes)
      else
        Myxy.post(base_path, attributes)
      end
    end

    module ClassMethods
      def where(arguments = {})
        uri = URI(base_path)
        uri.query = URI.encode_www_form(arguments)
        Myxy.get(uri.to_s).all
      end

      def find_by(arguments = {})
        uri = URI(base_path)
        uri.query = URI.encode_www_form(arguments)
        Myxy.get(uri.to_s).first
      end

      def all
        Myxy.get(base_path).all
      end
    end

    # Getter/Setter for resource
    def method_missing(method, *args, &block)
      yield if block
      if /^(\w+)=$/ =~ method
        set_attribute($1, args[0])
      else
        nil unless @attributes[method.to_sym]
      end
      @attributes[method.to_sym]
    end

    private

    def set_attribute(attribute, value)
      @attributes[attribute.to_sym] = value
    end

    def base_path
      Utils.collection_path self.class.name
    end
  end
end
