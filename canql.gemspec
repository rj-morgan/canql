# frozen_string_literal: true
# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'canql/version'

Gem::Specification.new do |spec|
  spec.name          = 'canql'
  spec.version       = Canql::VERSION
  spec.authors       = ['PHE NDR Development Team']
  spec.email         = []

  spec.summary       = 'Congenital Anomaly Natural Query Language'
  spec.description   = 'Domain Specific Language for querying PHE NCARDRS datastores'
  spec.homepage      = 'https://github.com/PublicHealthEngland/canql'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.4'

  spec.files         = `git ls-files -z`.split("\x0").
                       reject { |f| f.match(%r{^(test|spec|features)/}) }
  # SECURE BNS 2018-08-06: Minimise sharing of (public-key encrypted) slack secrets in .travis.yml
  spec.files         -= %w[.travis.yml] # Not needed in the gem
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'chronic', '~> 0.3'
  spec.add_dependency 'ndr_support', '>= 3.0', '< 6'
  spec.add_dependency 'rails', '>= 4.1', '< 6'
  spec.add_dependency 'treetop', '>= 1.4.10'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-minitest'
  spec.add_development_dependency 'guard-rubocop'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'ndr_dev_support', '~> 3.1', '>= 3.1.3'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'terminal-notifier-guard' if RUBY_PLATFORM =~ /darwin/
end
