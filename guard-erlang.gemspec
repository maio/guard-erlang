# -*- encoding: utf-8 -*-
require File.expand_path('../lib/guard/erlang/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "guard-erlang"
  gem.version       = Guard::Erlang::VERSION
  gem.description   = "Guard::Erlang automatically compile your erlang file"
  gem.summary       = "Guard gem for Erlang"
  gem.authors       = ["HpyHacking"]
  gem.email         = ["jackchiu.org@gmail.com"]
  gem.homepage      = "http://github.com/hpyhacking/guard-erlang"

  gem.add_dependency 'guard', '>= 0.8.3'

  gem.files         = Dir.glob('{bin,lib}/**/*') + %w[LICENSE README.md]
  gem.require_paths = ["lib"]
end
