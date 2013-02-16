# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'product_spy/version'

Gem::Specification.new do |gem|
  gem.name          = "product_spy"
  gem.version       = ProductSpy::VERSION
  gem.authors       = ["Paul Spieker"]
  gem.email         = ["p.spieker@duenos.de"]
  gem.description   = %q{ProductSpy is made for parsing product URLs, i.e. Amazon-URLs, to get the product keys and creating product URLs based on these keys. This can be used to identify products based on the url or just to clean up product URLs.}
  gem.summary       = %q{ProductSpy is made for parsing product URLs, i.e. Amazon-URLs, to get the product keys and creating product URLs based on these keys}
  gem.homepage      = "https://github.com/spieker/product_spy"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'addressable'
end
