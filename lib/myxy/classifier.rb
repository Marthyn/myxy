require File.expand_path('../log', __FILE__)

module Myxy
  class Classifier
    def self.parse(data, klass)
      if data.is_a? Array
        Classifier.multiple(data, klass)
      else
        Classifier.create_object(data, klass)
      end
    end

    def self.multiple(resources, klass)
      results = []
      resources.each do |resource|
        results << Classifier.create_object(resource, klass)
      end
      results
    end

    def self.create_object(resource, klass)
      Module.const_get(klass).new(resource)
    rescue NameError => e
      Log.info("Unkown resource found, #{e.message}")
      false
    end
  end
end
