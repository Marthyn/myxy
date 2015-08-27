# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'myxy/version'

Gem::Specification.new do |spec|
  spec.name          = "myxy"
  spec.version       = Myxy::VERSION
  spec.authors       = ["Marthyn"]
  spec.email         = ["Marthyn@live.nl"]

  spec.summary       = %q{An API wrapper for Calendar42}
  spec.homepage      = "https://github.com/Marthyn/myxy"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday"
  spec.add_dependency "json"
  spec.add_dependency "ffaker"
  spec.add_dependency "dotenv", "~> 2.0.2"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "mutant"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "guard-rubocop"
  spec.add_development_dependency "simplecov-rcov"
end
