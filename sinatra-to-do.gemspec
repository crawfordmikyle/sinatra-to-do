# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sinatra/to/do/version"

Gem::Specification.new do |spec|
  spec.name          = "sinatra-to-do"
  spec.version       = Sinatra::To::Do::VERSION
  spec.authors       = ["Mikyle Crawford"]
  spec.email         = ["crawfordmikyle@gmail.com"]

  spec.summary       = "Sinatra todo list app"
  spec.description   = "Supports multiple users and allows them to make a todo list"
  #spec.homepage      = "www.hasnowebpage.io"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]


  spec.add_dependency "sinatra", "~> 2.0"
  spec.add_dependency "rack-flash3"
  spec.add_dependency "bcrypt"
  spec.add_dependency "require_all"
  spec.add_dependency "rack","~> 2.0"
  spec.add_dependency "rack-protection", "~> 2.0"
  spec.add_dependency "tilt", "~> 2.0"


  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
