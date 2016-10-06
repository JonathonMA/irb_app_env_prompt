# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "irb_app_env_prompt/version"

Gem::Specification.new do |spec|
  spec.name          = "irb_app_env_prompt"
  spec.version       = IRBAppEnvPrompt::VERSION
  spec.authors       = ["Jonathon M. Abbott"]
  spec.email         = ["jonathona@everydayhero.com.au"]

  spec.summary       = "Show current app environment in rails console"
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/JonathonMA/irb_app_env_prompt"
  spec.license       = "MIT"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rubocop", "~> 0.43.0"
end
