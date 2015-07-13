require 'uri'
require File.expand_path("../utils", __FILE__)
require File.expand_path("../classifier", __FILE__)

module Myxy
  module Resource
    attr_accessor :attributes

    def initialize(attributes = {})
      @attributes = attributes
    end

    def save
      if self.id
        uri = URI.join(base_path, id)
        Myxy.put(uri.to_s, attributes)
      else
        Myxy.post(base_path, attributes)
      end
    end

    module ClassMethods
      def klass_name
        self.new.class.name
      end

      def base_path
        Utils.collection_path klass_name
      end

      def where(arguments = {})
        uri = URI(base_path)
        uri.query = URI.encode_www_form(arguments)
        results = Myxy.get("#{uri.to_s}/").all
        Classifier.parse(results, klass_name)
      end

      def find_by(arguments = {})
        uri = URI(base_path)
        uri.query = URI.encode_www_form(arguments)
        result = Myxy.get("#{uri.to_s}/").first
        Classifier.parse(result, klass_name)
      end

      def all
        results = Myxy.get("#{base_path}/").all
        Classifier.parse(results, klass_name)
      end
    end

    def self.included(base)
      base.extend(ClassMethods)
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
  end
end
