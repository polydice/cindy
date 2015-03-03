# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cindy/version'

Gem::Specification.new do |gem|
  gem.name          = "cindy"
  gem.version       = Cindy::VERSION
  gem.authors       = ["Richard Lee"]
  gem.email         = ["rl@polydice.com"]
  gem.description   = %q{A lightweight and flexible Ruby SDK for Sendy, a self-hosted email newsletter app.}
  gem.summary       = %q{Simple Ruby wrapper for Sendy API.}
  gem.homepage      = "https://github.com/polydice/cindy"

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^spec/})
  gem.require_paths = ["lib"]

  gem.add_dependency("faraday", "~> 0.8.5")
  gem.add_dependency('faraday_middleware', '~> 0.9')
  gem.add_dependency('hashie', '~> 3.4')

  gem.add_development_dependency("rake", "~> 10.4.2")
  gem.add_development_dependency("rspec", "~> 2.12.0")
end
