# -*- encoding: utf-8 -*-
require File.expand_path('../lib/bullseye/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["John Bintz"]
  gem.email         = ["john@coswellproductions.com"]
  gem.description   = %q{Implement DOM-ready execution in Rails using the Asset Pipeline.}
  gem.summary       = %q{Implement DOM-ready execution in Rails using the Asset Pipeline.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "bullseye"
  gem.require_paths = ["lib"]
  gem.version       = Bullseye::VERSION

  gem.add_dependency 'tilt'
  gem.add_dependency 'sprockets'
  gem.add_dependency 'sass'
end
