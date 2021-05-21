# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative "lib/latest_rails_posts/version"

Gem::Specification.new do |spec|
  spec.name          = "latest_rails_posts"
  spec.version       = LatestRailsPosts::VERSION
  spec.authors       = ["Andrea"]

  spec.summary       = "Read through Dev.to's latest posts on Rails."
  spec.homepage      = "https://github.com/AndreaJasper/cli-data-gem-project"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  # spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.executables = "latest_rails_posts"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.2"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "pry", "~> 0.14.0"

  spec.add_runtime_dependency "nokogiri", "1.11.2"
