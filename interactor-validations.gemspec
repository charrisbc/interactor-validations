# coding: utf-8
#lib = File.expand_path('../lib', __FILE__)
#$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
#require 'interactor-validations/version'

Gem::Specification.new do |s|
  s.name        = 'interactor-validations'
  s.version     = '0.0.1'
  s.summary     = "An add-on gem for Interactors to allow the use of ActiveModel::Validations."
  s.description = s.summary
  s.authors     = ["Charles Harris"]
  s.email       = 'charles.harris@bigcommerce.com'
  s.homepage    = 'https://github.com/charrisbc/interactor-validations'
  s.license       = 'MIT'

  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.add_development_dependency "bundler", "~> 1.7"
  s.add_development_dependency "rspec",   "~> 2.14.0"
  s.add_development_dependency "pry"
  s.add_development_dependency "rake"

  s.add_dependency "interactor", "~> 3.0"
  s.add_dependency "rails", "~> 4.1"
  s.add_dependency "active_model", "~> 4.1"
end
