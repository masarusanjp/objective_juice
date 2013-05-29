# -*- encoding: utf-8 -*-
require File.expand_path('../lib/objective_juice/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["masarusanjp"]
  gem.email         = ["masarusanplusplus@gmail.com"]
  gem.description   = %q{Convert the object to the objective-c literal}
  gem.summary       = %q{Convert the object to the objective-c literal}
  gem.homepage      = "https://github.com/masarusanjp/objective_juice"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "objective_juice"
  gem.require_paths = ["lib"]
  gem.version       = ObjectiveJuice::VERSION

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
end
