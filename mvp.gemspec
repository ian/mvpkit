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
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'analytics-ruby'
  s.add_dependency 'bootstrap-sass'
  s.add_dependency "browserify-rails"
  s.add_dependency 'carrierwave'
  s.add_dependency 'client_side_validations'
  s.add_dependency 'client_side_validations-simple_form'
  s.add_dependency 'coffee-rails', '~> 4.1.0'
  s.add_dependency 'faraday'
  s.add_dependency 'font-awesome-rails'
  s.add_dependency "carrierwave"
  s.add_dependency "cloudinary"
  s.add_dependency "dotenv-rails"
  s.add_dependency "geocoder"
  s.add_dependency 'fog'
  s.add_dependency 'fog-aws'
  s.add_dependency "hashie"
  s.add_dependency 'jquery-rails'
  s.add_dependency "rack-canonical-host"
  s.add_dependency "rails", "~> 4.2.3"
  s.add_dependency 'rollbar'
  s.add_dependency 'sass-rails', '~> 5.0'
  s.add_dependency "simple_form"
  s.add_dependency 'sitemap_generator'
  s.add_dependency 'slack-notifier'

  s.add_development_dependency "sqlite3"
end
