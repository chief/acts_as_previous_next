$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "acts_as_previous_next/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "acts_as_previous_next"
  s.version     = ActsAsPreviousNext::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of ActsAsPreviousNext."
  s.description = "TODO: Description of ActsAsPreviousNext."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.0.rc1"

  s.add_development_dependency "mysql2"
end
