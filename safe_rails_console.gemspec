$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "safe_rails_console/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "safe_rails_console"
  s.version     = SafeRailsConsole::VERSION
  s.authors     = ["Uchio KONDO"]
  s.email       = ["udzura@udzura.jp"]
  s.homepage    = "https://github.com/udzura/safe_rails_console"
  s.summary     = "Point database to *_readonly on rails console --sandbox"
  s.description = "Point database to *_readonly on --sandbox"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.1"

  s.add_development_dependency "sqlite3"
end
