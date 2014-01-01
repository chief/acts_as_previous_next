$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "acts_as_previous_next/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "acts_as_previous_next"
  s.version     = ActsAsPreviousNext::VERSION
  s.authors     = ["Giorgos Tsiftsis"]
  s.email       = ["giorgos.tsiftsis@gmail.com"]
  s.homepage    = "https://github.com/chief/acts_as_previous_next"
  s.summary     = "A gem allowing an actire_record model to have previous, next based on a column."
  s.description = "This 'acts_as' extension provides the capability for having previous next methods for object.
  Previous & next are based on a specified column (default is id)."

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
  #s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency 'rails', '~> 3.2.1'

  s.add_development_dependency 'mysql2'
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'spork'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'guard-rspec'
end
