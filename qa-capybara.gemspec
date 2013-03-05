# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'qa-capybara/version'

Gem::Specification.new do |gem|
  gem.name          = "qa-capybara"
  gem.version       = Qa::Capybara::VERSION
  gem.authors       = ["Marek Kowalcze"]
  gem.email         = ["marek.kowalcze@gmail.com"]
  gem.description   = %q{Capybara Console for QA}
  gem.summary       = %q{Capybara Console for QA}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'capybara'
  gem.add_dependency 'pry'
end
