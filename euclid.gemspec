# -*- encoding: utf-8 -*-
require File.expand_path('../lib/euclid/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Scott Woody"]
  gem.email         = ["swoody92@gmail.com"]
  gem.description   = %q{This gem wraps the Euclid Elements API}
  gem.summary       = %q{Wraps basic API commands in Ruby}
  gem.homepage      = ""
  
  gem.add_development_dependency "rest-client"
  gem.add_development_dependency "json"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "euclid"
  gem.require_paths = ["lib"]
  gem.version       = Euclid::VERSION
end
