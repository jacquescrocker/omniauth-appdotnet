# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-appdotnet/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jacques Crocker"]
  gem.email         = ["railsjedi@gmail.com"]
  gem.description   = %q{OmniAuth strategy for App.net.}
  gem.summary       = %q{OmniAuth strategy for App.net.}
  gem.homepage      = "https://github.com/railsjedi/omniauth-appdotnet"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-appdotnet"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::AppDotNet::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0'
  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
end
