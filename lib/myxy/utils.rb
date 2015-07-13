module Myxy
  module Utils
    def self.demodulize(class_name_in_module)
      class_name_in_module.to_s.sub(/^.*::/, "")
    end

    def self.pluralize(word)
      word.to_s.sub(/([^s])$/, '\1s')
    end

    def self.modulize(class_name)
      "Myxy::#{class_name}"
    end

    def self.collection_path(class_name)
      (Utils.pluralize Utils.demodulize class_name).downcase
    end

    def self.camelize(word, uppercase_first_letter = true)
      if uppercase_first_letter
        word.to_s.gsub(%r{/\/(.?)/}) { "::" + $1.upcase }.gsub(/(^|_)(.)/) { $2.upcase }
      else
        word[0] + Utils.camelize(word)[1..-1]
      end
    end
  end
end
