require 'uri'
require File.expand_path('../utils', __FILE__)
require File.expand_path('../classifier', __FILE__)

module Myxy
  module Resource
    attr_accessor :attributes

    def initialize(attributes = {})
      @attributes = Utils.normalize_attributes(attributes)
    end

    def base_path
      Utils.collection_path self.class.name
    end

    def update_params
      params.each do |key, value|
        set_attribute(key, value)
      end
    end

    def save(params = nil)
      update_params(params) if params
      if id
        uri = "#{base_path}/#{id}/"
        Myxy.put(uri.to_s, attributes)
      else
        Myxy.post(base_path, attributes)
      end
    end

    module ClassMethods
      def base_path
        new.base_path
      end

      def klass_name
        new.class.name
      end

      def get(arguments)
        uri = URI(base_path)
        uri.query = URI.encode_www_form(arguments)
        Myxy.get("#{uri}/")
      end

      def find(id)
        uri = URI(base_path)
        parse(Myxy.get("#{uri}/#{id}/").all).first
      end

      def where(arguments = {})
        get(arguments).all
      end

      def find_by(arguments = {})
        parse(get(arguments).first)
      end

      def parse(data)
        Classifier.parse(data, klass_name)
      end

      def all
        parse(Myxy.get("#{base_path}/").all)
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

    def set_attribute(attribute, value)
      @attributes[attribute.to_sym] = value if valid_attribute?(attribute)
    end

    def valid_attribute?(attribute)
      valid_attributes.include?(attribute.to_sym)
    end

    def valid_attributes
      @valid_attributes ||= mandatory_attributes.inject(other_attributes, :<<)
    end

    def valid?
      mandatory_attributes.each do |attribute|
        return false unless @attributes.key? attribute
      end
      true
    end
  end
end
