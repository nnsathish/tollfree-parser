
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tollfree_parser/version"

Gem::Specification.new do |spec|
  spec.name          = "tollfree_parser"
  spec.version       = TollfreeParser::VERSION
  spec.authors       = ["Sathishkumar Natesan"]
  spec.email         = ["nnsathish@gmail.com"]

  spec.summary       = %q{Toll free number parser}
  spec.description   = %q{Translates toll free numbers to possible words}
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = Dir['lib/**/*.rb', 'bin/*', '*'] - %w(lib bin spec)
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '~> 2.4'
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
