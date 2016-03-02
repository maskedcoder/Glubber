
require File.expand_path("../lib/glubber/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "glubber"
  s.version     = Glubber::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Andrew Myers"]
  s.email       = ["maskedcoder@hush.com"]
  s.homepage    = "http://github.com/maskedcoder/glubber"
  s.summary     = "Static-site generator"
  s.description = "Web-based static-site generator"

  s.required_rubygems_version = ">= 1.3.6"

  # lol - required for validation
  s.rubyforge_project         = "glubber"

  # If you have other dependencies, add them here
  s.add_dependency "sinatra", "~> 1.4.7"

  # If you need to check in files that aren't .rb files, add them here
  s.files        = Dir["{lib}/**/*.rb", "{templates}/**/*.tpl", "{templates}/**/*.yml", "bin/*", "LICENSE", "*.md"]
  s.require_path = 'lib'

  # If you need an executable, add it here
  # s.executables = ["glubber"]

  # If you have C extensions, uncomment this line
  # s.extensions = "ext/extconf.rb"
end
