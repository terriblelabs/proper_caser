# -*- encoding: utf-8 -*-
require File.expand_path('../lib/proper_caser/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jeffrey Chupp"]
  gem.email         = ["jeff@semanticart.com"]
  gem.description   = %q{Get educated guesses about proper capitalization of words and phrases}
  gem.summary       = %q{Leverage google search to clean up poor capitalization in dirty data}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "proper_caser"
  gem.require_paths = ["lib"]
  gem.add_dependency('google-search', '>= 1.0.2')
  gem.add_dependency('nokogiri', '>= 1.5.3')
  gem.version       = ProperCaser::VERSION
end
