# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative "lib/latest_rails_posts/version"

Gem::Specification.new do |spec|
  spec.name          = "latest-rails-posts"
  spec.version       = LatestRailsPosts::VERSION
  spec.authors       = ["Andrea"]

  spec.summary       = "Read through Dev.to's latest posts on Rails."
  spec.homepage      = "https://github.com/AndreaJasper/cli-data-gem-project"
  spec.license       = "MIT"
  spec.files         =  ["lib/latest_rails_posts.rb", "lib/latest_rails_posts/cli.rb", "lib/latest_rails_posts/scraper.rb", "lib/latest_rails_posts/movie.rb", "config/environment.rb"]
  # spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.executables = "latest-rails-posts"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.2"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "pry", "~> 0.14.0"
  spec.add_runtime_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "colorize", ">= 0"
end