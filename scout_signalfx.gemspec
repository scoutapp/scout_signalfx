# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scout_signalfx/version'

Gem::Specification.new do |spec|
  spec.name          = "scout_signalfx"
  spec.version       = ScoutSignalfx::VERSION
  spec.authors       = ["Derek Haynes"]
  spec.email         = ["derek.haynes@gmail.com"]

  spec.summary       = "Reports app performance metrics gathered via Scout to SignalFx"
  spec.homepage      = "https://github.com/scoutapp/scout_signalfx_ruby"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "mocha"
  spec.add_development_dependency "fakeweb", ["~> 1.3"]

  spec.add_runtime_dependency "scout_apm", "~> 2.4.11.pre"
  spec.add_runtime_dependency "signalfx"

end
