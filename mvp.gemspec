$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mvp/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mvp"
  s.version     = Mvp::VERSION
  s.authors     = ["Ian Hunter"]
  s.email       = ["ianhunter@gmail.com"]
  s.homepage    = "http://github.com/ian/mvp"
  s.summary     = "The start-to-finish 3 minute product platform"
  s.description = "Built for Developers. Ideal for MVPs, product ideation and validation."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  # s.files = Dir["engine/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'analytics-ruby', '~> 0'
  s.add_dependency 'bootstrap-sass', '~> 0'
  s.add_dependency "browserify-rails", '~> 0'
  s.add_dependency 'carrierwave', '~> 0'
  s.add_dependency 'client_side_validations', '~> 0'
  s.add_dependency 'client_side_validations-simple_form', '~> 0'
  s.add_dependency "cloudinary", '~> 0'
  s.add_dependency "dotenv-rails", '~> 0'
  s.add_dependency "geocoder", '~> 0'
  s.add_dependency 'faraday', '~> 0'
  s.add_dependency 'fog', '~> 0'
  s.add_dependency 'fog-aws', '~> 0'
  s.add_dependency 'font-awesome-sass', '~> 0'
  s.add_dependency "hashie", '~> 0'
  s.add_dependency 'jquery-rails', '~> 0'
  s.add_dependency "rack-canonical-host", '~> 0'
  s.add_dependency 'rack-ssl-enforcer', '~> 0'
  s.add_dependency "rails", "~> 4.2"
  s.add_dependency 'rollbar', '~> 0'
  s.add_dependency 'sass-rails', '~> 5.0'
  s.add_dependency "simple_form", '~> 0'
  s.add_dependency 'sitemap_generator', '~> 0'
  s.add_dependency 'slack-notifier', '~> 0'

  s.add_development_dependency "byebug", '~> 0'
  s.add_development_dependency "better_errors", '~> 0'
  s.add_development_dependency "binding_of_caller", '~> 0'
  s.add_development_dependency "bullet", '~> 0'
  s.add_development_dependency "semantic", '~> 0'
  s.add_development_dependency 'web-console', '~> 2.0'
  s.add_development_dependency 'spring', '~> 0'
end
