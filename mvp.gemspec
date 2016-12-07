$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "minimum_viable_product/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "minimum_viable_product"
  s.version     = MinimumViableProduct::VERSION
  s.authors     = ["Ian Hunter"]
  s.email       = ["ianhunter@gmail.com"]
  s.homepage    = "http://github.com/ian/minimum_viable_product"
  s.summary     = "The start-to-finish 3 minute product platform"
  s.description = "Built for Developers. Ideal for MVPs, product ideation and validation."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  # s.files = Dir["engine/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]
  s.executables = ['mvp']

  s.add_dependency 'analytics-ruby'
  s.add_dependency 'carrierwave'
  s.add_dependency "cloudinary"
  s.add_dependency "geocoder"
  s.add_dependency 'faraday'
  s.add_dependency 'fog'
  s.add_dependency 'fog-aws'
  s.add_dependency "hashie"
  s.add_dependency "rack-canonical-host"
  s.add_dependency 'rack-ssl-enforcer'
  s.add_dependency "rails", "~> 4.2.3"
  s.add_dependency 'rollbar'
  s.add_dependency 'sass-rails', '~> 5.0'
  s.add_dependency 'sitemap_generator'
  s.add_dependency 'slack-notifier'

  s.add_development_dependency "byebug"
  s.add_development_dependency "better_errors"
  s.add_development_dependency "binding_of_caller"
  s.add_development_dependency "bullet"
  s.add_development_dependency "semantic"
  s.add_development_dependency 'web-console', '~> 2.0'
  s.add_development_dependency 'spring'
end
