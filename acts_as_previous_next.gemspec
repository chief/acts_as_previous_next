$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "acts_as_previous_next/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "acts_as_previous_next"
  s.version     = ActsAsPreviousNext::VERSION
  s.authors     = ["Giorgos Tsiftsis"]
  s.email       = ["giorgos.tsiftsis@gmail.com"]
  s.homepage    = ""
  s.summary     = "TODO: Summary of ActsAsPreviousNext."
  s.description = "TODO: Description of ActsAsPreviousNext."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency 'rails', '~> 3.2.0.rc2'

  s.add_development_dependency 'mysql2'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'spork', '0.9.0.rc9'
  s.add_development_dependency 'rb-fsevent'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'libnotify'
  #s.add_development_dependency 'cancan'
end
